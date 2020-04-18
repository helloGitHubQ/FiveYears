<!--TOC-->

- [if](#if)
- [where](#where)

- [trim](#trim)
- [choose](#choose)
- [set-if&trim-if动态更新数据](#set-if&trim-if动态更新数据)
- [foreach](#foreach)
  - [遍历集合](#遍历集合)
  - [批量保存](#批量保存)
- [内置参数](#内置参数)
- [bind](#bind)
- [sql](#sql)

<!--TOC-->

# 动态SQL:black_large_square:

### if

```xml
<select id="findActiveBlogWithTitleLike" resultType="Blog">
    SELECT * FROM BLOG
    WHERE state = ‘ACTIVE’
    <!-- test：判断表达式（OGNL），从参数值中取值判断；遇到特殊字符应该去转义 -->
    <if test="title != null">
    AND title like #{title}
    </if>
</select>
```



*if 标签中 test 属性用的就是 ONGL 表达式*

[ONGL表达式](http://commons.apache.org/proper/commons-ognl/language-guide.html)



特殊字符需要进行转移！

[XML语法规则](https://www.w3school.com.cn/xml/xml_syntax.asp)

### where

查询的时候如果某些条件没有带可能 sql 拼装会有问题

1、给 where 后面加上 1=1 ，以后条件都是 and XXX（不推荐使用）

2、mybatis 使用 where 标签来将所有的查询条件包括在内。

​		where 只会去掉第一个 多出来的and 或者 or 

### trim

- prefix 前缀

  给拼串后的整个字符串加一个前缀

- suffix 后缀

  给拼串后的整个字符串加一个后缀

- prefixOverrides 前缀覆盖

  去掉整个字符串前面多余的字符

- suffixOverrides 后缀覆盖

  去掉整个字符串后面多余的字符

```xml
<trim prefix="WHERE" prefixOverrides="AND |OR ">
...
</trim>

<trim prefix="SET" suffixOverrides=",">
...
</trim>
```

### choose

choose (when, otherwise)（分支选择）switch-case

- when 当满足 test 中条件时 选择 对应 when 标签下的语句
- otherwise  当所有 when 都不满足的时候选择 otherwise 标签下的语句

```xml
<select id="findActiveBlogLike" resultType="Blog">
SELECT * FROM BLOG WHERE state = ‘ACTIVE’
    <choose>
        <when test="title != null">
        	AND title like #{title}
        </when>
        <when test="author != null and author.name != null">
        	AND author_name like #{author.name}
        </when>
        <otherwise>
        	AND featured = 1
        </otherwise>
    </choose>
</select>
```

### set-if&trim-if动态更新数据

- set-if 可以实现动态数据的更新（就是说如果你传入 username 的话就更新 username ，如果你传入 password 的话就更新 password ...）

*如果你不用 set 标签的话，就后面那个 , 符号去不掉。*

```xml
<update id="updateAuthorIfNecessary">
    update Author
    <set>
        <if test="username != null">username=#{username},</if>
        <if test="password != null">password=#{password},</if>
        <if test="email != null">email=#{email},</if>
        <if test="bio != null">bio=#{bio}</if>
    </set>
    where id=#{id}
</update>
```

- trim-if 也可以达到一样的效果。前缀设置成 set 后缀覆盖 ,

```xml
<update id="updateAuthorIfNecessary">
    update Author
<trim prefix="SET" suffixOverrides=",">
		<if test="username != null">username=#{username},</if>
        <if test="password != null">password=#{password},</if>
        <if test="email != null">email=#{email},</if>
        <if test="bio != null">bio=#{bio}</if>
</trim>
     where id=#{id}
</update>
```

### foreach 

#### 遍历集合

- collection 

  指定要遍历的集合。list 类型的参数会特殊处理封装在 map 中，map 的 key 叫 list

- item 

  将当前遍历出的元素赋值给指定的变量

- index 

  索引.遍历 list 集合 index 是索引.

  遍历 map 的时候 index 表示 key，item 表示 value.

- open

  遍历出所有结果拼接一个开始的字符

- close

  遍历出所有结果拼接一个结束的字符

#{变量名}：就能取出变量的值也就是当前遍历出的元素

```xml
<select id="selectPostIn" resultType="domain.blog.Post">
    SELECT *
    FROM POST P
    WHERE ID in
        <foreach item="item" index="index" collection="list"
       	 	open="(" separator="," close=")">
       	 	#{item}
        </foreach>
</select>
```

#### 批量保存

1. mysql 中支持 insert into .. values(),() 这种语法。所以就利用这点进行书写批量保存 

```xml
<insert id="addEmps">
    insert into tb_emplotee(last_name,email,gender,d_id)
    values
    <foreach collection="emps" item="emp" open="(" close=")" separator=",">
      #{emp.lastName},#{emp.email},#{emp.gender},#{emp.dept.id}
    </foreach>
  </insert>
```

2. 每插入一条数据就写一条插入数据。需要设置数据库连接属性 allowMultiQueries = true  *不建议使用*

`url: jdbc:mysql://...?characterEncoding=utf-8&allowMultiQueries=true`

```xml
<insert id="addEmps">
    <foreach collection="emps" item="emp" separator=";">
     insert into tb_emplotee(last_name,email,gender,d_id)
    values  (#{emp.lastName},#{emp.email},#{emp.gender},#{emp.dept.id})
    </foreach>
  </insert>
```

 **可以用此方法批量删除，批量修改**

---

Oracle 中支持批量插入的两种方式：

:one:多个 insert 在 begin - end 里面

```sql
begin
	insert into employees(employee_id,last_name,email)
	values(employees_seq.nextval,'test1','test1@163.com');
	insert into employees(employee_id,last_name,email)
	values(employees_seq.nextval,'test2','test2@163.com');
end;
```

```xml
<insert id="addEmps" databaseId="oracle">
    <foreach collection="emps" item="emp" open="begin" close="end;">
      insert into employees(employee_id,last_name,email)
      values(employees_seq.nextval,#{emp.employeeId},#{emp.email});
    </foreach>
  </insert>
```



:two:利用中间表​

```sql
insert into employees(employee_id,last_name,email)

select employeesz_seq.nextval,lastName,email from (
	select 'test3' lastName,'test3@163.com' email from dual
    union
    select 'test4' lastName,'test4@163.com' email from dual
)
```



```xml
<insert id="addEmps" databaseId="oracle">
    <foreach collection="emps" item="emp" open="insert into employees(employee_id,last_name,email)
    select employeesz_seq.nextval,lastName,email from (" close=")" separator="union">
	select #{emp.lastName} lastName,#{emp.email} email from dual
    </foreach>
  </insert>
```

### 内置参数

- _databaseId  

如果配置了**databaseIdProvider** 标签，_databaseId 就表示当前数据库的别名

```xml
<insert id="insert">
    <selectKey keyProperty="id" resultType="int" order="BEFORE">
        <if test="_databaseId == 'oracle'">
        	select seq_users.nextval from dual
        </if>
        <if test="_databaseId == 'db2'">
        	select nextval for seq_users from sysibm.sysdummy1"
        </if>
    </selectKey>
    insert into users values (#{id}, #{name})
</insert>
```

- _parameter 

单个参数的时候代表整个参数。

多个参数的时候参数会被封装为一个 map; _parameter 就代表这个 map



```xml
<insert id="InnerParameter" resultType="Emplees">
	<if test="_databaseId == 'mysql' ">
    	select * from tbl_employee
        <if test="_parameter!=null">
        	where last_name=#{lastName}
        </if>
    </if>
    <if test="_databaseId == 'oracle' ">
    	select * from employees
        <if test="_parameter!=null">
        	where last_name=#{lastName}
        </if>
    </if>
</insert>

```

### bind

可以将 ONGL 表达式绑定到一个变量中，方便之后引用这个变量的值。

```xml
<select id="selectBlogsLike" resultType="Blog">
    <bind name="pattern" value="'%' + _parameter.getTitle() + '%'" />
    SELECT * FROM BLOG
    WHERE title LIKE #{pattern}
</select>
```

### sql

抽取可重用的 sql 片段，方便之后使用。

- sql 抽取。经常要将查询的列名或者插入用的列名抽取出来方便引用
- include 来引用已经抽取的 sql
- include 还可以自定义一些 property ，sql 标签内部就能使用自定义的属性 include-property，取值的正确方式是${prop}，不能使用这种方式#{prop}



```xml
<insert>
	insert into employees(
    <include refid="insertColumn"></include>
    )
    ....
</insert>

<sql id="insertColumn">
	<if test="_databaseId == 'oracle'">
    	employee_id,last_name,email
    </if>
    <if test="_databaseId == 'mysql'">
    	last_name,email,gender,d_id
    </if>
</sql>
```

