PL/SQL Developer -- Oracle
---
5/11/2019 9:59:33 AM 

其实通过 PL/SQL Developer 可视化工具导出数据库中的数据有很多方式.例如 SQL ， Excel 等等；也可以通过 Tools -> Export Tables..导出数据导出文件格式 dmp , sql , pde 等。

1. SQL Windows下通过查询语句，然后导出数据（文件格式为sql）
![导出数据方式1](https://i.imgur.com/FdJFc5j.png)
2. 通过PL/SQL中工具的导出数据
![导出数据方式2](https://i.imgur.com/txCn4zS.png)


---
- 导出

导出的时候并无多大差别

+ 导入

但是如果数据量大的时候。一种方式是通过复制 SQl 文件中的内容到数据库执行，另一种方式是通过 dmp 文件进行导入。两者之间就有很大差别,第一种方式 PL/SQL 直接变得卡顿,第二种并无异常。

所以，以后如果 PL/SQL 之间的导出和导入数据的话，建议使用 Tools->Export Tables..方式实现。这样不会影响工作效率，自己心情也会很好。

