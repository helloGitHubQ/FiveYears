# mybatis 中设计模式

学习设计模式的一种方式就是通过学习框架的实现来了解设计模式！



## 建造模式 - Builder

![](../image/designPatterns/sqlSessionFactory.png)

上图是 sqlSessionFactory 的创建过程。

其中的 XmlConfigBuilder 和 XmlMapperBuilder 就是用到设计模式中的建造模式！