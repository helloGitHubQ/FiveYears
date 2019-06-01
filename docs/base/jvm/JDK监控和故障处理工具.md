## JDK监控和故障处理工具

### JDK命令行工具
---
1. jps(JVM Process Status):

查看所有 JAVA 进程的启动类，传入参数和 JVM 参数等等。

2. jstat（JVM Statistics Monitoring Tool）：

用于收集 HotSpot 虚拟机各方面的运行数据。

![jstat](https://i.imgur.com/271LEyY.png)

3. jinfo（Configuration Info for Java）：

显示虚拟机配置信息。

4. jmap（Memory Map for Java）：

生成堆转储快照。

5. jhat（JVM Heap Dump Browser ）：

用于分析 headump 文件，它会建立一个 HTTP/HTML 服务器，让用户可以在浏览器上查看结果。

6. jstack（Stack Trace for Java）：

生成虚拟机当前时刻的线程快照。


### JDK 可视化分析工具
---

JConsole:Java 监视和管理控制台

Visual VM : 多合一故障处理工具


注：**看完还是一脸懵逼。(^_−)☆**