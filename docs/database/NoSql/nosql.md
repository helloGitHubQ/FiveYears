# NoSql
## 概述
访问量上升，使用缓存技术来缓解数据库访问的压力。

- 是什么

    	数据类型存储不需要固定的模式，无需多余操作就可以横向扩展。

- 能干嘛

		1. 易扩展
		2. 大数据量高性能
		3. 多样灵活的数据模型

键值对存储

- 去哪下

		1. Redis
		2. Memcache
		3. Mongdb

- 怎么玩

		1. KV
		2. Cache
		3. Persistence

## 3V & 3高
大时代的3V：

- 海量 Volume
- 多样 Variety
- 实时 Velocity

互联网需求的3高：

- 高并发
- 高扩展
- 高性能

## 当下 NoSql 的经典应用

![NoSql应的经典场景](https://i.imgur.com/46I2w3P.png)

多数据源多数据类型的存储问题。

[阿里巴巴中文网站首页]
....

## 数据模型简介

例子：以一个电商客户、订单、订购、地址模型来对比下关系型数据库和非关系型数据库。

高并发的操作不太建议有关联查询。

分布式事务是支持不了太多的并发的。

聚合模型：

	1. KV键值
	2. Bson
	3. 列族
	4. 图形

## NoSQL的四大分类

- KV键值对：
- 文档型数据库（bson比较多）：MongoDB(基于分布式文件存储的数据库)
- 列存储数据库：
	- 分布式文件系统
	- Cassandra,HBase
- 图关系数据库：
	- 它不是方图形的，放的是关系。比如：朋友圈社交网络、广告推荐系统，社交网络等

四者对比：

## 分布式数据库 CAP 原理
**CAP：**

- Consistency（强一致性）
- Availability（可用性）
- Partition tolerance(分区容错性)

一个分布式系统不能同时满足一致性、可用性和分区容错性这三个需求。最多只能满足两个
**CAP的3进2**

CA 的传统 Oracle 数据库。

AP 是大多数网站架构的选择。

CP redis、MongoDB


**BASE:**

是为了解决关系型数据强一致性引起的问题而引起的可用性降低而提出的解决方案。

基本可用（Basically Available）
软状态(Soft state)
最终一致(Eventually consistent)