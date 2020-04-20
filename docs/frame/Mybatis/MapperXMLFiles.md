<!-- TOC -->

- [增删改](#增删改)
- [insert](#insert)
- [参数处理](#参数处理)
  - [单个参数：](#单个参数：)
  - [多个参数：](#多个参数：)
- [select](#select)
  - [返回List](#返回List)
  - [返回Map](#返回Map)
  - [resultMap](#resultMap)
    - [自定义结果集映射规则](#自定义结果集映射规则)
    - [关联查询](#关联查询)
- [discriminator鉴别器](#discriminator鉴别器)

<!-- TOC -->

# 映射文件

XXXMapper.xml

- cache 给一个命名空间赋值从一个配置文件中
- cache-ref 
- resultMap  结果集,mybatis是都放在 map 中
- parameterMap  参数集,mybatis也是放在 map 中
- sql  
- insert   插入
- update 更新
- delete 删除
- select 查询

## 增删改

- parameterType可省略.

- mybatis 允许增删改直接定义以下类型返回值 **Integer、Long、Boolean、void**

- 我们需要手动提交数据

  **sqlSessionFactory.openSession();**   ---- 手动提交

  **sqlSessionFactory.openSession(true);** ----  自动提交

## insert

### :heavy_check_mark:获取自增主键的值

#### **mysql** 

支持自增主键，自增主键的获取,mybatis也是利用 statement.getGenreatedKeys()

**useGenreatedKeys = "true"**：使用自增主键获取主键策略。

**keyProperty**：指定对应的主键属性，也就是 mybatis 获取主键后，将这个值封装给 javaBean 的。

```xml
<insert id="addEmp" parameterType="..." useGeneratedKeys="true" keyProperty="id">
	insert into tbl_employee(last_name,email,gender)
	values(#{lastName},#{emil},#{gender})
</insert>
```

#### **Oralce**

不支持自增，Oracle使用序列来模拟自增；

每次插入的数据的主键从序列中拿值，如何获取到这个值。

selectKey：

​	keyProperty 查出主键值封装给 javaBean 的哪个属性。

​	order  BEFORE 在 sql 插入之前运行 | AFTER  在sql 插入之后运行。

​	resultType 查询的数据的返回值类型。

   ... 

```xml
<insert id="addEmp" databaseId="oracle">
	<selectKey keyProperty="id" order="BEFORE" resultType="Integer">
	<!-- 编写查询主键的sql语句-->
		select EMPLOYEES_SEQ.nextval from dual
	</selectKey>
	<!--插入时的主键是从序列中拿到的-->
	insert into employees(employee_id,last_name,email)
	values(#{id},#{lastName},#{email})
</insert>
```

## 参数处理

### 单个参数：

mybatis 不会做特殊处理

#{参数名}：取出参数值

### 多个参数：

mybatis 会做特殊处理

多个参数会被封装成一个 map；

key ：param1.....paramN

value：传入的参数值

#{}就是从 map 中获取指定的 key 的值。



:heavy_check_mark:**命名参数**（多个参数推荐）：

明确指定封装参数时 map 的 key ；**@Param("id")**

多个参数会被封装成一个 map；

key : 使用 @Param 注解指定的值

value：参数值

#{指定的 key }：取出对应的参数值

#### POJO：

如果多个参数正好是我们业务逻辑的数据模型，我们就可以直接传入 pojo；

​		#{属性名}：取出传入的 pojo 属性值

#### Map：

如果多个参数不是业务模型中的数据，没有对应的 pojo ,不经常使用，为了方便，我们可以传入 map 

​		#{key} ：取出 map 中对应的值

#### TO：

如果多个参数不是业务模型中的数据，但是经常使用，推荐编写一个 TO （Transfer Object）数据传输对象。

Page{int index;int size;}



**特别注意：**如果是 Collection （List、Set）类型或者是数组，也会做特殊处理。也把传入的 list 或者数组封装到 map 中

​		key ：Collection ，如果是 List 还可以使用这个 key (List)  数组(array)

​		取值：取出来第一个id值：#{list[0]}

```
总结：
	参数多的时候会封装 map ，为了不混乱，我们可以使用@Param来指定封装时使用的 key;
	#{key}就可以取出map中的值
```

### #和$的区别

- ${}：取出的值直接拼在sql语句中；会有安全问题
- #{}：是以预编译的形式，将参数设置到 sql 语句中；PreparedStatement ；防止 sql 注入

原生的 jdbc 不支持占位符的地方我们就可以使用 ${} 进行取值。比如分表，排序等等

### #{}更丰富的用法

规定参数的一些规则

*javaType、jdbcType、mode（存储过程）、numericScale、resultMap、typeHandler、jdbcTypeName、expression（未来准备的功能）*

> ​	org.apache.ibatis.type.JdbcType

- jdbcType 通常需要在某种特定的条件下被设置：

在我们数据为 null 的时候，有些数据库可能不识别 mybatis 对 null 的默认处理。

比如 Oracle （报错）JdbcType OTHER：无效的类型；

因为 mybatis 对所有的 null 都映射的是原生 Jdbc 的 OTHER 类型。

由于全局配置中，jdbcTypeForNull=OTHER ；Oralce 不支持，有两种办法：

1、`#{email，jdbcType=NULL}`

2、`jdbcTypeForNull=NULL`

​			`<setting name="jdbcTypeForNull" value="NULL"/>`

## select

### 返回List

### 返回Map

- 返回一条记录的map：key 就是列名，值就是对应的值。

```java
public Map<String,Object> ...(Integer id);
```

- :heavy_check_mark:多条封装记录一个map：Map<Integer,Emploee> 键是这个记录的主键，值是封装之后的javabean

```java
@MapKey("id")
public Map<Integer,Employee> ...(Integer id);
```

### resultMap

####  :heavy_check_mark:自定义结果集映射规则

就是自定义某个javaBean的封装规则。 resultMap 和 resultType 只能二选一

- type	自定义规则的Java类型
- id 唯一id方便使用
  - id 定义主键底层会有优化
  - column 指定哪一列
  - property 指定对应的 javaBean 属性

```xml
<resultMap type="" id="">
    <!-- 指定主键列的封装规则	-->
	<id column="id" property="id"></id>
    <!-- 定义普通列封装规则 -->
    <result column="last_name" property="LastName"/>
    <!-- 其他不指定列会自动封装：我们只要写 resultMap 就把全部的映射规则都写上 -->
    <result column="email" property="email"/>
    <result column="gender" property="gender"/>
</resultMap>
<select id="getEmpById" resultMap="MyEmp">
	select * from tbl_employee where id=#{id}
</select>
```

#### :heavy_check_mark:关联查询

就是查询 Employee(员工) 表数据是也要查出 Dept(部门) 表

- 级联属性封装结果

```xml
<!-- 联合查询：级联属性封装结果 -->
<resultMap type="" id="">
	<id column="id" property="id"/>
    <result column="last_name" property="lastName"/>
    <result column="gender" property="gender"/>
    <result column="did" property="dept.id"/>
    <result column="dept_name" property="dept.departmentName"/>
</resultMap>
<select id="getEmpAndDeptId" resultMap="MyDifEmp">
	sXXXXX(SQL语句)
</select>
```

- **assoction** 定义关联对象封装规则

可以指定联合 javaBean 对象

1. property="dept"：指定哪个属性是联合的对象

2. javaType：指定这个属性对象的类型(不能省略)

```xml
<resultMap type="" id="">
	<id column="id" property="id"/>
    <result column="last_name" property="lastName"/>
    <result column="gender" property="gender"/>
    
    <!--  association可以指定联合的 javaBean 对象  -->
    <association property="dept" javaType="">
    	 <id column="did" property="id"/>
    	 <result column="dept_name" property="departmentName"/>
    </association>
</resultMap>
```

- association 分步查询

select : 表明当前属性是调用 select 指定的方法查出的结果

column：指定将哪一列的值传给这个方法

流程：使用select指定方法（传入 column 指定的这列参数的值）查出对象，并封装给 property 指定属性

```xml
<resultMap id="MyEmpByStep" type="">
	<id column="id" property="id"/>
    <result column="last_name" property="lastName"/>
    <result column="email" property="email"/>
    <result column="gender" property="gender"/>
    <assoction property="dept" 
               select="com.atguigu.mybatis.dao.DepartmentMapper.getDeptById"
               column="d_id"></assoction>
</resultMap>
<select id="getEmpByIdStep" resultMap="MyEmpByStep">
	select * from tbl_employee where id=#{id}
</select>
```

- association  分布查询&异步加载

每次查询 Employee 对象的时候，会一起查询出来；部门信息在我们使用的时候再去查询。

可以使用 *延迟加载*（*懒加载 / 按需加载*）（在分步查询的基础上加上两个配置）

aggressiveLazyLoading | multipleResultSetsEnabled 

```xml
//mybatis-conf.xml
...
<settings>
	<setting name="aggressiveLazyLoading" value="true"/>
    <setting name="multipleResultSetsEnabled " value="true"/>
</settings>
...

```

- collection 嵌套结果集的方式，定义关联的集合类型元素的封装规则

查询部门的时候，将部门所有对应的员工信息查出来。

ofType ：指定集合里面元素的类型

```xml
<resultMap type="com.atguigu.mybatis.bean.Department" id="MyDept">
	<id column="did" property="id"/>
    <result column="dept_name" property="departmentName"/>
 
    <!--  collection定义关联集合类型的属性的封装规则   -->
    <collection property="emps" ofType="">
        <!-- 定义这个集合中元素的封装规则 -->
    	 <id column="id" property="id"/>
         <result column="last_name" property="lastName"/>
   		 <result column="gender" property="gender"/>
    	 <result column="email" property="email"/>
    </collection>
</resultMap>
<select id="getDeptByIdPlus" resultMap="MyDept">
	sXXXXX(SQL语句)
</select>
```

- collection  分布查询&异步加载

```xml
<resultMap type="com.atguigu.mybatis.bean.Department" id="MyDeptStep">
	<id column="did" property="id"/>
    <result column="dept_name" property="departmentName"/>
 
    <!--  collection定义关联集合类型的属性的封装规则   -->
    <collection property="emps" 
                select="com.atguigu.mybatis.dao.EmployeeMapperPlus.getEmpsById"
                column="id">
        <!-- 定义这个集合中元素的封装规则 -->
    	 <id column="id" property="id"/>
         <result column="last_name" property="lastName"/>
   		 <result column="gender" property="gender"/>
    	 <result column="email" property="email"/>
    </collection>
</resultMap>
<select id="getDeptByIdStep" resultMap="MyDeptStep">
	sXXXXX(SQL语句)
</select>
```

- 扩展

多列的值传递过去：将多列的值封装 map 传递；

column="{key1=column1,key2=column2}"

fetchType="lazy"  ：表示延迟加载

- lazy ：延迟加载
- eager：立即加载

```xml
<resultMap type="com.atguigu.mybatis.bean.Department" id="MyDeptStep">
	<id column="did" property="id"/>
    <result column="dept_name" property="departmentName"/>
 
    <!--  collection定义关联集合类型的属性的封装规则   -->
    <collection property="emps" 
                select="com.atguigu.mybatis.dao.EmployeeMapperPlus.getEmpsById"
                column="{deptId=id}"
                fetchType="lazy">
        <!-- 定义这个集合中元素的封装规则 -->
    	 <id column="id" property="id"/>
         <result column="last_name" property="lastName"/>
   		 <result column="gender" property="gender"/>
    	 <result column="email" property="email"/>
    </collection>
</resultMap>
<select id="getDeptByIdStep" resultMap="MyDeptStep">
	sXXXXX(SQL语句)
</select>
```

## discriminator鉴别器

mybatis 使用 discriminator 判断某列值，然后根据某列的值改变封装行为。

- column：指定判定的列名
- javaType：列名对应的 java 类型

封装 Employee:

​	如果查出的是女生，就把部门信息查询出来，否则不查询。

​	如果查出的是男生，把 last_name 这一列的值赋值给email。

```xml
<resultMap id="MyEmpDis" type="">
	<id column="id" property="id"/>
    <result column="last_name" property="lastName"/>
    <result column="email" property="email"/>
    <result column="gender" property="gender"/>
    
    <discriminator javaType="string" column="gender">
    	<!--女生 resultType:指定封装的结果类型-->
        <case value="0" resultType="com.atguigu.mybatis.bean.Employee">
         	<assoction property="dept" 
               select="com.atguigu.mybatis.dao.DepartmentMapper.getDeptById"
               column="d_id"></assoction>
        </case>
        <!--男生-->
        <case value="1" resultType="com.atguigu.mybatis.bean.Employee">
        	<id column="id" property="id"/>
            <result column="last_name" property="lastName"/>
            <result column="last_name" property="email"/>
            <result column="gender" property="gender"/>
        </case>
    </discriminator>

</resultMap>
<select id="getEmpByIdStep" resultMap="MyEmpDis">
	select * from tbl_employee where id=#{id}
</select>
```

