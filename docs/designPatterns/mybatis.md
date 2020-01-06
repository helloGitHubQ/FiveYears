# mybatis 中设计模式

学习设计模式的一种方式就是通过学习框架的实现来了解设计模式！



## 建造模式 - Builder

![](../image/designPatterns/sqlSessionFactory.png)

上图是 sqlSessionFactory 的创建过程。

其中的 XmlConfigBuilder 和 XmlMapperBuilder 就是用到设计模式中的建造模式！



## 策略模式 & 装饰模式

![](../image/designPatterns/sqlSession.png)

**策略模式：**

DefaultSqlSession 发送语句到 Executor(执行器/接口)，然后 Executor 根据自己的执行策略区创建对应的具体执行器。比如默认 mybatis 是开启二级缓存的(`<setting name="cacheEnabled" value="true"/>`) 那么 mybatis 就会创建一个 CacheExecutor 。

StatementHandler 也是策略模式的体现！！！

**装饰模式：**

CatcheExecutor 去调用 SimpleExecutor 的情况下，是因为 CatcheExecutor 在 SimpleExecutor 的基础之上又加上了一个缓存。这就所谓的二级缓存。