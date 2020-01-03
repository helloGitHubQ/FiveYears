# Tomcat使用过程

## 新环境

- 官网上下载 zip 格式文件，直接解压就可以用。

  

- 配置环境变量（此电脑 -> 属性 -> 高级系统设置 -> 环境变量 ->系统变量）

  - 新增一个 CATALINA_HOME 的变量名

    变量值时 tomcat 的解压路径

  ![](../image/tools/Tomcat/CATALINA_HOME.png)

  - 修改 Path 的变量名

    新增三个变量值

    ​	%CATALINA_HOME%\lib

    ​	%CATALINA_HOME%\lib\servlet-api.jar

    ​	%CATALINA_HOME%\lib\jsp-api.jar

    ![](../image/tools/Tomcat/Path.png)

- 配置用户信息

  在 conf 目录下有个 tomcat-users.xml 文件打开。加入（最后一行之前）以下内容：

  ```xml
  <role rolename="manager-gui"/> 
  <role rolename="admin-gui"/>  
  <user username="admin" password="admin" roles="admin-gui"/>
  <user username="tomcat" password="admin" roles="manager-gui"/>
  ```

- 起 Tomcat 

  在 bin 目录下找到 startup.bat 点击启动 Tomcat

- 成功！

`org.apache.catalina.startup.Catalina.start Server startup in 618 ms`

- 访问 & 结束

  http://localhost:8080/

  会出现以下界面。收工！！！

![](../image/tools/Tomcat/tomcat.png)