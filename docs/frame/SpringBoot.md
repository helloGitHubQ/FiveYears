# Spring Boot
Spring Boot 是 Spring开源组织下的一个子项目，也是Spring组件一站式解决方案，主要是为了简化使用Spring框架的难度，简省繁重的配置。

Spring Boot 提供了各种组件的启动器（starters），开发者只要能配置好对应组件参数，Spring Boot就会自动配置，让开发者能快速搭建依赖于 Spring 组件的 Java 项目

[官网](https://spring.io/projects/spring-boot)

[源码](https://github.com/spring-projects/spring-boot)

[Spring Boot 核心配置文件详解](https://mp.weixin.qq.com/s?__biz=MzI3ODcxMzQzMw==&mid=2247486541&idx=2&sn=436ab454a6367fdc33912162855c02c7&scene=21#wechat_redirect)

[官方文档理解](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/frame/SpringBootOfficial.md)

---
**面试前的瞎几把准备--云栖学院**

微服务架构：

优点：

	每个微服务可独立运行在自己的进程里
	一系列独立运行的微服务共同构建起整个系统
	每个服务为独立的业务开发，关注特定的功能
	微服务之间通过一些轻量级通信机制进行通信
	可以使用不同的语言与数据存储技术
	全自动独立部署

缺点：

	测试复杂，多个微服务联调
	需要使用分布式事务
	实现服务间的通信机制
	各个服务开发团队沟通成本提高

**spring 开发微服务的弊端：**

1. 大量的 XML 配置文件，配置繁琐
2. 整合第三方框架常引起包冲突


什么是springboot?

spring Boot 不是微服务框架，而是 Spring 的一套快速配置脚手架。可以基于 spring Boot 快速开发单个微服务。

spring Boot 整合的框架：

	Spring IO Plarform：用于版本话应用程序的企业级开发。
	Spring Framework：用于事务管理，依赖注入，数据访问，消息传递和 Web 应用程序。
	Spring Cloud ：用于分布式系统，用于构建或部署你的微服务。
	Spring Data：用于数据访问相关的微服务，不管是映射幻视归约，关系型还是非关系型。
	Spring Batch：用于高级的批量操作。
	Spring Security：用于授权和认证支持。
	Spring REST 文档：用于 RESTful服务文档化。
	Spring Social：用于连接社交媒体 API
	Spring Mobile：适用于移动网络应用

## 创建 Spring Boot 项目：

	Spring Initializr
	Spring Bott CLI	
	Spring Tool Suite

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

---
atguigu -- bilibili

#SpringBoot 基础
## SpringBoot 入门
### 简介
> 简化 Spring 应用的一个框架
> 
> 整个Spring 技术栈的一个大集合
> 
> J2EE开发的一站式解决方案

### 微服务
2014  martin fowler

[单体应用]

[微服务图片]

每一个功能元素最终都是一个可独立替换和独立升级的软件单元。 

### 环境
- 环境约束：

		jdk 1.8:Spring Boot 是要求1.7及以上  jdk 1.8.0_181
		maven3.x :maven 3.3以上版本  Apache Maven 3.5.4
	    IntelliJ IDEA 2018.2.7 (Ultimate Edition) Windows 7 6.1
		SpringBoot 1.5.9.RELEASE: 1.5.9

- 配置Maven

给 Maven 的 settings.xml 配置文件的 profiles 标签中添加。使 Maven 知道自己是用 jdk 1.8 去启动的。（我这里呢就暂时先没有去改配置文件的路径，只是改了 Maven 的路径）

	 <profile>
      <id>jdk-1.8</id>

      <activation>
	  <activeByDefault>true</activeByDefault>
        <jdk>1.8</jdk>
      </activation>

     <properties>
			<maven.compiler.source>1.8</maven.compiler.source>
			<maven.compiler.target>1.8<maven.compiler.target>
			<maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>
	 </properties>
    </profile>

- 配置 Idea

使 IDEA 使用我们自己的安装的 Maven。

[Maven]
### HelloWorld
浏览器发送请求，服务器接收请求并处理。响应 HelloWorld 字符串。

- 创建一个 Maven 项目
- 在 pom.xml 中导入 SpringBoot 的相关依赖
- 编写主程序：启动 SPringBoot 应用(@SpringBootApplication)
- 编写相关的 Controller、Server
- 测试（运行 main 方法,访问 localhost:8080/hello）
- 简化部署工作

pom.xml 中加入打 jar 包的注解。运行  Maven Projects->项目下的 Lifecycle->package。打好 jar 包的位置会出现在 控制台上，找到相应的 jar 包。通过 java -jar 命令进行执行

### HelloWOrld探究
- pom 文件

父项目

Spring Boot的版本仲裁中心；
以后我们导入依赖默认是不需要写版本号（没有 dependencies 里面管理的依赖自然需要声明版本号）

启动器(starter)：

	<dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
    </dependency>

Spring-boot-starter-web:

Spring-boot-starter：Spring-Boot场景启动器；帮我们导入了 web 模块正常运行所依赖的组件。

SpringBoot 将所有的功能场景都抽取出来，做成一个个 starters（启动器），只需要在项目里面引入这些 starter 相关场景的所有依赖都会导入进来。要用什么功能就用什么场景的启动器

- 主程序类、主入口类

@SpringBootApplication：Spring Boot 应用注解标注在某个类上说明这个类是 SpringBoot 的主配置类。SpringBoot 就应该运行这个类的 main 方法来启动 SpringBoot 应用。

**@SpringBootConfiguration:** SpringBoot 的配置类；

标注在某个类上，说明这个类是 SpringBoot 的配置类。

  @Configuration:配置类上来标注这个注解。配置类 --- 配置文件。配置类也是容器中的组件

**@EnableAutoConfiguration:**开启自动配置功能。

 @AutoConfigurationPackage:自动配置包

   @Import(AutoConfigurationPackages.Registrar.class)：Spring 的底层注解 @import ,给容器中导入一个组件；导入的组件由 
AutoConfigurationPackages.Registrar.class

 `将主配置类(@SpringBootApplication标注的类)的所在包及下面所有子包里面的所有组件扫描到 Spring 容器； `

@Import(EnableAutoConfigurationImportSelector.class);

给容器导入组件。

	EnableAutoConfigurationImportSelector:导入哪些组件的选择器；
	将所有需要导入的组件以全类名的方式返回,这些组件就会被添加到容器中。
	会给容器导入很多的自动配置类（XXXAutoConfiguration）,就是给容器中导入这个场所需要的所有组件，并配置好这些组件。

有了自动配置类，就避免了我们手动编写配置注入功能组件等工作了。

`Spring Boot 在启动的时候从类路径下的 META-INF/spring.factories 中获取 EnableAutoConfiguration 指定的值，将这些值作为自动配置类导入到容器中，自动配置类就生效，帮我们自动配置工作。`

J2EE 的整体整合解决方案和自动配置都在 spring-boot-autoconfigure-1.5.9.RELEASE.jar

### 快速创建SpringBoot应用

Spring Initializer:快速向导

选择我们需要的模块，向导会联网创建 SpringBoot 项目。

默认生成的 SpringBoot 项目：主程序已经生成好了，我们只需要书写我们的逻辑。

resources 目录文件：
	- static ：保存所有的静态资源。 js css images
	- templates ：保存所有的模板页面；（Spring Boot 默认 jar 包使用嵌入式的 Tomcat ,默认不支持 JSP 页面）；但是可以使用模板引擎（freemarker、thymeleaf）
	- application.properties:Spring Boot 应用的配置文件。可以修改一些默认配置。 

## SpringBoot 配置
### 配置文件
Spring Boot 使用一个全局的配置文件，配置文件名是固定的。

- application.properties
- application.yml

配置文件的作用：修改 SpringBoot 自动配置的默认值。Spring Boot在底层都给我们自动配置好了。

YAML：是一个标记语言。	**是以数据为中心**，比 json、xml更适合做配置文件。

标记语言：

以前的配置文件，大多数都是使用 xxxx.xml 文件

`YML例子：`

`XML例子：`

### YAML语法
- 基本语法

k:(空格)v：表示一对键值对（空格必须有）。

以**空格**的缩进来控制层级关系，只要是左对齐的一列数据，都是同一层级的

	server:
		port: 8081
		path: /hello

属性和值大小写敏感。

- 值的写法

	- 字面量：普通值（数字、字符串、布尔）
	
			k:V: 字面量直接写；
			字符串默认不用加上单引号和双引号。
			""：双引号；不会转义字符串中的特殊字符，特殊字符会作为本身想表示的意思。
			name: "zhangsan \n lisi"
			输出:zhangsan 换行 lisi
			'':单引号；会转义特殊字符，特殊字符最后只是一个普通的字符串数据	
			name: "zhangsan \n lisi"
			输出:zhangsan \n lisi

	- 对象、Map（属性和值）（键值对）：

			k:v: 在下一行来写对象的属性和值的关系。注意缩进
			对象还是 k:v的方式
			friends:
				lastName: zhangsan
				age: 20

			行内写法：
			friends: {lastName: zhangsan,age 20}			

	- 数组（List、Set）：
		   
			用 - 值表示数组中的一个元素
			pets:
			- cat
			- dog
			- pig
			
			行内写法：
			pets: [cat,dog,pig]

### 配置文件注入

**@ConfigurationProperties:**告诉 SpringBoot 将本类中的所有属性和配置文件中相关属性进行绑定。

prefix = "person" ：配置文件中哪个下面的所有属性进行一一映射

只有这个组件是容器组件，才能使用容器提供的 @ConfigurationProperties 功能

**@Component：**容器注解

- properties配置文件编码问题

idea 默认的 properties 是 UTF-8 编码，需要去 idea 中设置转为 ascii 码(Settings->Editor->File Encodings->勾选 Transparent native-to-ascii conversion    然后 apply -> ok)

[properties编码问题]

- @Value获取值和@ConfigurationProperties获取值比较

|         | ConfigurationProperties           | @Value  |
| ------------- |:-------------:| -----:|
| 功能      | 批量注入配置文件中的属性 | 一个个指定 |
| 松散绑定（松散语法）      | 支持      |   不支持 |
| SpEL | 不支持    |    支持 |
| JSR303 | 支持    |    不支持 |
| 复杂类型封装 | 支持    |    不支持 |
	
配置文件yml还是properties他们都能获取值。

如果说，我们只是在某个业务逻辑中需要获取一下配置文件中的某项值，使用 @Value

如果说，我们专门编写一个 javaBean 来和配置文件进行映射，我们就直接使用 @ConfigurationProperties

- 配置文件注入值数据校验


- @PropertySource 和 @ImportResource
	- @PropertySource ：加载指定的配置文件
	- @ImportResource ：导入 Spring 的配置文件，让配置文件里面的内容生效。
	
	SpringBoot 里面没有 Spring 的配置文件。我们自己编写的配置文件，也不能自动识别。想让 Spring 的配置文件生效，加载进来。@ImportResource标注在一个配置类上

SpringBoot 推荐给容器中添加组件方式，推荐使用全注解方式

1. 配置类 ==== Spring 配置文件
2. 使用 @Bean 给容器中添加组件

- 配置文件占位符

随机数：


    ${random.value}、${random.int}、${random.long}、${random.int(10)}、${random.int[1024,65536]}

占位符之前配置的值，如果没有可以用 : 指定默认值	

- Profile
	- 多个 profile 文件：我们在主配置文件编写的时候，文件名可以是 appliction-{profile}.properties/yml。默认使用的配置文件是 appliction.properties 的配置
	- yml 支持多文档格式
	- 激活指定的 profile
		- 在配置文件中指定 spring.profiles.active=dev(指定的环境)
		- 命令行：
			java -jar jar包名称 --spring.profiles.active=dev;
			可以直接在测试的时候，配置传入命令行参数
		- 虚拟机参数：
			-Dspring.profiles.active=dev

- 配置文件加载的位置

SpringBoot 启动会扫描 application.properties 或 application.yml 文件作为 Spring Boot 的默认配置文件。

	-file:./config/
	-file:./
	-classpath:/config/
	-classpath:/

优先级从高到低，高优先级的配置会覆盖底优先级配置。SpringBoot 会从这四个位置全部加载配置文件。**互补配置**



`还可以通过 spring.config.location 来改变默认的配置文件的位置。`

**项目打包好后，我们还可以使用命令行参数的形式，启动项目的时候来指定配置文件的新位置；指定配置文件和默认加载的配置文件共同作用形成互补配置。**

- 外部配置的加载顺序

SpringBoot 也可以使用外部配置文件。优先级从高到低	；高优先级的配置覆盖低优先级的配置；所有配置会形成互补配置。

	1.命令行参数
	java -jar jar包 --server.port=8087
	多个参数用空格隔开；
	2.来自 java:comp/env 的 JNDI 属性
	3.Java 系统属性（System.getProperties()）
	4.操作系统环境变量
	5.RandomValuePropertySource 配置 random.* 属性值
	6.jar 包外部的 application-{profile}.properties 或 application-{profile}.yml （带spring.profile）配置文件
	7.jar 包内部的 application-{profile}.properties 或 application-{profile}.yml （不带spring.profile）配置文件
	8.jar 包外部的 application.properties 或 application-{profile}.yml （不带spring.profile）配置文件
	9.jar 包内部的 application.properties 或 application-{profile}.yml （不带spring.profile）配置文件
	10.@Configurtion 注解类上的 @PropertySource
	11.通过 SpringApplication.setDefaultProperties 指定的默认属性

所有支持的配置加载来源，参考官方文档！

**由 jar 包外向 jar 包内寻找**

**优先加载带 profile** 

**再加载不带 profile**

- **自动配置原理**

配置文件到底能写什么？怎么写？自动配置原理。

1. SpringBoot 启动的时候加载主配置类，开启了自动配置功能 @EnableAutoConfiguration 
2. @EnableAutoConfiguration 作用：
利用@EnableAutoConfigurationImportSelector 给容器中导入一些组件
可以查看 selectImports() 方法的内容
	
将类路径下 META-INF/spring.factories 里面配置的所有 EnableAutoConfiguration 的值加入到了容器中。

每一个这样的 xxxxAutoConfiguration 类都是容器中的一个组件，都加入到容器中。用它们来做自动配置。

3. 每一个自动配置类进行自动配置功能
4. 以 **HttpEncodingAutoConfiguration** 为例解释自动配置原理

		@Configuration
		@EnableConfigurationProperties({HttpProperties.class})
		@ConditionalOnWebApplication(
		    type = Type.SERVLET
		)
		@ConditionalOnClass({CharacterEncodingFilter.class})
		@ConditionalOnProperty(
		    prefix = "spring.http.encoding",
		    value = {"enabled"},
		    matchIfMissing = true
		)
		public class HttpEncodingAutoConfiguration {

根据当前不同的条件判断，决定这个配置类是否生效？

一旦配置类生效，这个配置类就会给容器添加各种组件；这些组件的属性是从对应的 properties 类中获取的，这些类里面的每一个属性又和配置文件绑定的。

5. 所有配置文件中能配置的属性都是在 XXXProperties 类中封装着；配置文件能配置什么就可以参照某个对应的这个属性类。

精髓：

	SpringBoot 启动会加载大量的自动配置类
	我们看我们需要的功能 SpringBoot 有没有默认写好的自动配置类
	我们再来看这个自动配置类到底配置了哪些组件(只要我们要用的组件由，我们就不需要再配置了)。
	给容器中自动配置添加组件的时候，会从 properties 类中获取某些属性。我们就可以在配置文件中指定这些属性了。

xxxxAutoConfiguration：自动配置类。给容器中添加组件

xxxxProperties : 封装配置文件中的相关属性。


## SpringBoot与日志
## SpringBoot与Web开发
## SpringBoot与Docker
## SpringBoot与数据访问
## SpringBoot启动配置原理
## SpringBoot自定义starters


---
#SpringBoot 高级部分
##SpringBoot与缓存
JSR107
Spring的缓存抽象
## SpringBoot与消息
## SpringBoot与检索
## SpringBoot与任务
## SpringBoot与安全
## SpringBoot与分布式
## SpringBoot与开发热部署
## SpringBoot与监控管理

​