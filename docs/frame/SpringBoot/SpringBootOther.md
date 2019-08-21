# SpringBoot一些的其他东西

**面试前的瞎几把准备--云栖学院**

微服务架构：

优点：

```
每个微服务可独立运行在自己的进程里
一系列独立运行的微服务共同构建起整个系统
每个服务为独立的业务开发，关注特定的功能
微服务之间通过一些轻量级通信机制进行通信
可以使用不同的语言与数据存储技术
全自动独立部署
```

缺点：

```
测试复杂，多个微服务联调
需要使用分布式事务
实现服务间的通信机制
各个服务开发团队沟通成本提高
```

**spring 开发微服务的弊端：**

1. 大量的 XML 配置文件，配置繁琐
2. 整合第三方框架常引起包冲突

什么是springboot?

spring Boot 不是微服务框架，而是 Spring 的一套快速配置脚手架。可以基于 spring Boot 快速开发单个微服务。

spring Boot 整合的框架：

```
Spring IO Plarform：用于版本话应用程序的企业级开发。
Spring Framework：用于事务管理，依赖注入，数据访问，消息传递和 Web 应用程序。
Spring Cloud ：用于分布式系统，用于构建或部署你的微服务。
Spring Data：用于数据访问相关的微服务，不管是映射幻视归约，关系型还是非关系型。
Spring Batch：用于高级的批量操作。
Spring Security：用于授权和认证支持。
Spring REST 文档：用于 RESTful服务文档化。
Spring Social：用于连接社交媒体 API
Spring Mobile：适用于移动网络应用
```

## 创建 Spring Boot 项目：

```
Spring Initializr
Spring Bott CLI	
Spring Tool Suite
```

## Spring Boot 核心：

- 起步依赖

其实就是特殊的 maven，利用传递依赖解析，把常用库聚合在一起，组成几个特定功能而定制的依赖。

把你从"需要这些库的哪些版本"中解放出来

- 自动配置

针对很多 Spring应用程序常见的应用功能，Spring Boot 能自动提供相关配置。

- 命令行界面

一个可选特性，借此你只需写代码就能完成完整的应用程序，无需传统项目构建。

- Actuator

提供在运行时检查引用程序内部情况。

spring Boot 引导类：

每个 Spring Boot 都有一个引导类，它作用为整个工程