# Mybatis/iBatis
iBatis曾是开源软件组 Apache 推出的一种轻量级的对象关系映射持久层框架，随着开发团队转投 Google Code 旗下，ibtatis 3.x 正式改名为 Mybatis 即iBatis 2.x,MyBatis 3.x

[官网](http://www.mybatis.org/mybatis-3/)

[源码](https://github.com/mybatis/mybatis-3)

---
[MyBatis基础--黑马视频](https://www.evernote.com/l/Ajjo99Mnz05NGrjyGDT_Okj4XiOd8aa4dDI/)

----

![](../../image/mybatis/mybatis2.png)

## HelloWorld

1. 根据 xml 配置文件（全局配置文件）创建一个 SqlSessionFactory 对象。有数据源一些运行环境信息
2. sql 映射文件：配置每一个 sql ，以及  sql 的封装规则等。
3. 将 sql 映射文件注册在全局配置文件中
4. 代码部分：
   1. 根据全部配置文件得到 sqlSessionFactory 
   2. 使用 sqlSession 工厂，获取 sqlSession 对象使用来执行增删改查；一个 sqlSession 就表示和数据库的一次会话，用完关闭。
   3. 使用 sql 的唯一标识来告诉 Mybatis 执行哪个 sql 。sql 是保存在 sql 映射文件中的。

**参考官方文档 2.1 Getting started**

## 接口式编程

接口和SQL动态绑定

1. 获取 sqlSessionFactory 对象
2. 获取 sqlSession 对象
3. 获取接口的实现类（会为接口自动创建一个代理对象，代理对象去执行增删改查方法）

**平常用的最多的**



```
1.mybatis: XXXMapper ---> XXMapper.xml 
2.SqlSession 代表和数据库的一次会话；用完必须关闭。
3.SqlSession和connection一样都是线程非安全的。每次使用都应该去获取新的对象。
4.mapper接口没有实现类，但是 mybatis 会为这个接口生成一个代理对象。（将接口和xml绑定）
5.两个重要的配置文件：
		mybatis的全局配置文件；包含数据库连接池信息，事务管理信息等....系统运行环境信息
		sql映射文件：保存每一个sql语句的映射信息；将 sql 抽取出来
```

## 全局配置文件

3 Configuration XML 

### 1.引入 dtd 约束：

就是为了在 xml  文件中书写配置文件的时候有提示。

idea 中很简单。将光标放在 http://mybatis.org/dtd/mybatis-3-config.dtd 后面，然后 Alt+Enter 组合键，然后回车就可以啦！其他配置文件也是一样的。

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <environments default="development">
        <environment id="development">
            <transactionManager type="JDBC"/>
            <!--修改数据源的基本信息-->
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://localhost:3306/test"/>
                <property name="username" value="root"/>
                <property name="password" value="****"/>
            </dataSource>
        </environment>
    </environments>

    <!---->
    <mappers>
        <mapper resource="EmployeeMapper.xml"/>
    </mappers>
</configuration>
```

### 2.引入外部配置文件

3.1.1 properties 

mybatis 中可以使用 **properties** 来引入外部 properties 配置文件的内容；

有两个标签：

- resource：引入类路径下的资源
- url：引入网络路径或磁盘路径下的资源

### 3.Configuration XML 

#### 1)、settings

3.1.2 settings  

**settings** 中包含很多很重要的设置项

setting：用来设置每一个设置项

- name ：设置项名

- value：设置项取值

  ```xml
  <settings>
      <setting name="cacheEnabled" value="true"/>
      <setting name="lazyLoadingEnabled" value="true"/>
      <setting name="multipleResultSetsEnabled" value="true"/>
      <setting name="useColumnLabel" value="true"/>
      <setting name="useGeneratedKeys" value="false"/>
      <setting name="autoMappingBehavior" value="PARTIAL"/>
      <setting name="autoMappingUnknownColumnBehavior" value="WARNING"/>
      <setting name="defaultExecutorType" value="SIMPLE"/>
      <setting name="defaultStatementTimeout" value="25"/>
      <setting name="defaultFetchSize" value="100"/>
      <setting name="safeRowBoundsEnabled" value="false"/>
      <setting name="mapUnderscoreToCamelCase" value="false"/>
      <setting name="localCacheScope" value="SESSION"/>
      <setting name="jdbcTypeForNull" value="OTHER"/>
      <setting name="lazyLoadTriggerMethods" value="equals,clone,hashCode,toString"/>
  </settings>
  ```

#### 2)、typeAliases 

**typeAliases**  ： 别名处理器，可以为我们的 java 类型起别名

1、typeAlias：为某个 java 类型起别名

​	alias：指定新的别名

​	type：指定要起别名的类型全类名；默认别名就是小写；

```xml
<typeAliases>
    <typeAlias alias="Author" type="domain.blog.Author"/>
    <typeAlias alias="Blog" type="domain.blog.Blog"/>
    <typeAlias alias="Comment" type="domain.blog.Comment"/>
    <typeAlias alias="Post" type="domain.blog.Post"/>
    <typeAlias alias="Section" type="domain.blog.Section"/>
    <typeAlias alias="Tag" type="domain.blog.Tag"/>
</typeAliases>
```

2、package：为某个包下所有类型批量起别名。

​	name：指定报名（为当前包以及下面所有的后代包的每一个类都起一个默认别名）

```xml
<typeAliases>
	<package name="domain.blog"/>
</typeAliases>
```

3、批量起别名的情况下，使用 @Alias注解给某个类型起新的别名

```java
@Alias("author")
public class Author {
...
}
```

注意：

- 别名不区分大小写
- mybatis 中预先给我们设定了一些别名（基本数据类型和它们的包装类、集合、日期、迭代器等）

#### 3)、typeHandlers 

typeHandlers：类型处理器

NOTE If you use classes provided by JSR-310(Date and Time API), you can use the [mybatistypehandlers-jsr310](https://github.com/mybatis/typehandlers-jsr310)

#### 4)、plugins 

plugins：插件

- Executor (update, query, flushStatements, commit, rollback, getTransaction, close, isClosed)
- ParameterHandler (getParameterObject, setParameters)
- ResultSetHandler (handleResultSets, handleOutputParameters)
- StatementHandler (prepare, parameterize, batch, update, query) 

#### 5)、environments 

environments：可以配置多种环境； default 指定使用某种环境。可以达到快速切换

environment：配置一个具体的环境环境，必须有两个标签。id代表当前环境的唯一标识

​		transactionManager：事务管理器。

​				type：事务管理器的类型。[JDBC（JdbcTransactionFactory）|MANAGED(MabagedTransactionFactory)|自定义事务管理器：实现 TransactionFactory 接口 ，type 指定为全类名] 

​		dataSource：数据源。

​				type：数据源类型。[UNPOOLED(UnpooledDataSourceFactory)|POOLED(PooledDataSourceFactory)|JNDI(JndiDataSourceFactory)|自定义数据源：实现 DataSourceFactory 接口，type 是全类名] 



```xml
<environments default="development">
    <environment id="development">
        <transactionManager type="JDBC">
        <property name="..." value="..."/>
    </transactionManager>
        <dataSource type="POOLED">
            <property name="driver" value="${driver}"/>
            <property name="url" value="${url}"/>
            <property name="username" value="${username}"/>
            <property name="password" value="${password}"/>
        </dataSource>
    </environment>
</environments>
```

#### 6)、databaseIdProvider 

databaseldProvider：支持多数据库厂商。

DB_VENDOR ：作用就是得到数据库厂商的标识（驱动getDatabaseProductName() ），mybatis 就能根据数据库厂商标识来执行不同的sql

```xml
<databaseIdProvider type="DB_VENDOR">
    <property name="SQL Server" value="sqlserver"/>
    <property name="DB2" value="db2"/>
    <property name="Oracle" value="oracle" />
</databaseIdProvider>
```

#### 7)、mappers

mappers：SQL  映射注册到全局配置中，注册配置文件。

​	resource：引用类路径下的 sql 映射文件；

​	url：引用网络路径或磁盘路径下的 sql 映射文件。



​	注册接口

​		class：引用（注册）接口，

​				1、有 sql 映射文件，映射文件名必须和接口同名，并且放在与接口同一个包下

​				2、没有 sql 映射文件，所有的 sql 都是利用注解写在接口上

​				推荐做法是：**比较重要的，复杂的 DAO 接口我们来写 sql 映射文件；不重要的，简单的 DAO 接口为了开发快速可以使用注解。**

## 映射文件

#### 增删改

- mybatis 允许增删改直接定义以下类型返回值 Integer、Long、Boolean、void

- 我们需要手动提交数据

  sqlSessionFactory.openSession();   手动提交

  sqlSessionFactory.openSession(true); 自动提交

#### 获取自增主键的值

- **mysql** 支持自增主键，自增主键的获取,mybatis也是利用 statement.getGenreatedKeys()

useGenreatedKeys = "true"：使用自增主键获取主键策略

keyProperty：指定对应的主键属性，也就是 mybatis 获取主键后，将这个值封装给 javaBean 的

- **Oralce**不支持自增，Oracle使用序列来模拟自增；

每次插入的数据的主键从序列中拿值，如何获取到这个值。

#### 参数处理

- 单个参数：mybatis 不会做特殊处理

#{参数名}：取出参数值

- 多个参数：mybatis 会做特殊处理

多个参数会被封装成一个 map；

key ：param1.....paramN

value：传入的参数值

#{}就是从 map 中获取指定的 key 的值。



**命名参数**：明确指定封装参数时 map 的 key ；@Param("id")

​					多个参数会被封装成一个 map；

​					key : 使用 @Param 注解指定的值

​					value：参数值

#{指定的 key }：取出对应的参数值



POJO：

如果多个参数正好是我们业务逻辑的数据模型，我们就可以直接传入 pojo；

​		#{属性名}：取出传入的 pojo 属性值



Map：

如果多个参数不是业务模型中的数据，没有对应的 pojo ,不经常使用，为了方便，我们可以传入 map 

​		#{key} ：取出 map 中对应的值



TO：

如果多个参数不是业务模型中的数据，但是经常使用，推荐编写一个 TO （Transfer Object）数据传输对象。



**特别注意：**如果是 Collection （List、Set）类型或者是数组，也会做特殊处理。也把传入的 list 或者数组封装到 map 中

​		key ：Collection ，如果是 List 还可以使用这个 key (List)  数组(array)

​		取值：取出来第一个id值：#{list[0]}

## 动态sql

## 缓存

## 整合Spring

