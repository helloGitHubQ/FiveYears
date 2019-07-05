<!-- TOC -->
- [Spring4](#Spring4)
	- [入门和常用配置](#入门和常用配置)
	- [Spring的IOC注解开发](#Spring的IOC注解开发)
	- [Spring的AOP的XML开发](#Spring的AOP的XML开发)
	- [事务](#事务)
	- [JDBC](#JDBC)


# Spring4
@heima

[官网](https://spring.io/projects/spring-framework)

[源码](https://github.com/spring-projects/spring-framework)
## 入门和常用配置
[之前学习的spring](https://www.evernote.com/shard/s568/nl/148198037/c736955a-bb3e-4d99-996d-71bb8701010e)

![spring](https://i.imgur.com/C22gCyl.png)

什么是Spring？

为什么使用Spring？

创建接口和类：SpringIOC 底层原理的实现

[SpringIOC 底层原理的实现]

工厂+反射+配置文件

IOC和DI：

Spring工厂类：

## Spring的IOC注解开发
- 创建项目，导jar包，配置文件（引入context约束）

![context约束](https://i.imgur.com/M48UrYc.png)

- 书写接口和实现类
- 开启spring组件扫描

![组件扫描](https://i.imgur.com/gswynsE.png)

- 类上加注解

    	@Compoent("userDao")

- 编写测试类

注解方式设置属性值：使用注解方式可以没有set方法。

1. 属性如果有set方法，需要将属性注解添加到set方法
2. 属性如果没有set方法，需要将属性注入的注解添加属性上

### 类上和属性注入的注解

1, Component 组件：

修饰一个类，把这个类交给 spring 管理。有三个衍生注解（功能类似），修饰注解
- Controller：web层
- Service：service层
- Repository：dao层

2, 属性注入注解：

普通属性：value（设置普遍属性的值）

对象类型属性：
- Autowried（设置对象类型的属性值，按照**类型**完成属性注入；如果想按照名称完成属性注入：必须使用@Autowried注解和@Qualifier一起来使用完成按照名称属性注入）
- @Resource:完成对象类型的属性注入，按照名称完成属性注入

3， Bean的其他注解

Bean的生命周期相关的注解：

- @PostConstruct：初始化方法
- @PreDestroy：销毁方法

Bean的作用范围的注解：

- @Scope（作用范围）：singleton（默认单例），prototype（多例），request,session,globalsession

4, XML和注解开发比较

适用场景：XML(任何场景)，注解（有些地方用不了，这类不是自己提供的）

优点：XML（结构清晰，维护方便），注解（开发方便）

XML和注解整合开发：XML管理Bean,注解完成属性注入

## Spring的AOP的XML开发
### AOP概述
AOP：面向切面编程。OOP的延伸和扩展。

![AOP应用场景](https://i.imgur.com/dXE2tq6.png)

权限校验，日志记录，性能监控，事务控制。

### Spring的AOP的底层实现原理

动态代理：
- JDK 动态代理：只能对实现了接口的类产生代理。
- Cglib 动态代理：对没有实现接口的类产生代理，生成子类对象。

### AOP开发（AspectJ的XML方式）
- 相关术语：

![AOP相关术语](https://i.imgur.com/iuOvnpM.png)

![AOP相关术语演示](https://i.imgur.com/Pyp9PFX.png)

- AOP开发入门

创建项目，引入jar包，引入spring的配置文件（AOP约束），编写目标类并完成配置文件，编写测试类

编写切面类，通过AOP的配置实现。

![AOP开发入门](https://i.imgur.com/Hkn4u02.png)

- 通知类型

![通知类型](https://i.imgur.com/e4SYjuC.png)

前置通知：获取切入点信息

后置通知：获得方法的返回值

环绕通知：阻止方法的执行

![前置通知后置通知环绕通知](https://i.imgur.com/oCHxYTJ.png)

- 切入点表达式

![切入点表达式](https://i.imgur.com/Y0bcJfm.png)

## 事务

## JDBC