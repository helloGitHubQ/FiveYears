#redis
[redis-runoob-1](https://www.evernote.com/l/AjiSRKOFU9JJrLaLy-g7SQaOPv7i7zBWlxg/)

[redis-runoob-2](https://www.evernote.com/l/AjhLPz3eb91KhYBieBemVl8x1CzlWfsKHko/)

[redis-imooc](https://www.evernote.com/l/AjhUFWvA80BMhaAGKs04lknLitMemHR8G9I/)

[Redis缓存之初识](https://www.evernote.com/l/AjhEnBQuzxxNlYPk9IXN8SmiLNgC3cOyDf4/)

---
## NoSql
[NoSql](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/database/NoSql/nosql.md)

## redis
1. 是什么

远程字典服务器（REmote DIctionary Server）,开源的，用C语言编写的，遵守BSD协议。是一个高性能的键值对分布式内存数据库，基于内存运行，并支持持久化的 NoSQL 数据库。

redis的三个特点：

- 支持数据的持久化。可以将内存中的数据保存在磁盘中，重启的时候再次加载使用。
- 支持简单的key-value类型的数据、list、set、zset、hash等数据结构的存储。
- 支持数据备份。即master-slave 模型的数据备份。

2. 能干什么

- 内存存储和持久化。
- 取最新的N个操作。
- 模拟类似于 HttpSession 这种需要设置过期时间的功能
- 发布，订阅消息系统。
- 定时器、计数器。

3. 去哪下

[redis官网](https://redis.io/ "redis官网")

[redis中文官方网站](http://www.redis.cn/ "redis中文官方网站")

4. 怎么玩

- 数据类型、基本数据和配置

- 持久化和复制，ROB/AOF

- 事务的控制

- 复制

- .....

### 杂项基础知识

- 单进程：

单进程模型来处理客户端请求。对读写等事件的响应是通过对 epoll 函数的包装来实现的。Redis 的实际处理速度完全依靠主进程的执行效率。

Epoll 是 Linux 内核为处理大批量文件描述而作了改进的 epoll,是 Linux 下多路复用 IO 接口 select / poll的增强版本。它能显著提高程序在大量并发连接中只有少量活跃的情况下的系统 CPU 利用率。

- 默认16个数据库，类似于数组下标，默认是从零号数据库开始
- select 数据库 去切换数据库
- Dbsize 查看当前数据库的 key 的数量
- Flushdb 清空当前库
- Flushall  通杀所有库 
- 统一密码管理，16个库要么都OK，要么都连不上
- Redis 索引是从零开始的
- 为什么端口号是 6379？

### 常用五大数据类型简介
- Redis 键(key)
- String （字符串）

是 redis 中最基本的数据类型，可以理解与Memcached 一模一样的类型，一个 key 对应一个 value。

是二进制安全的。意思是 redis 中 String 类型可以包含任何数据类型。比如 jpg 图片或者序列化

一个 Redis 中字符串中的value最多可以支持512M。

- Hash (哈希，类似于Map集合)

键值对集合。

是一个 String 类型的 field 和 value 的映射表，hash 特别适合存储对象。

类似于 java 里面中 Map<String,Object>

- List（列表）

是简单的字符串列表，按照插入顺序排序。你可以添加一个元素导列表的头部（左边）或者尾部（右边）

它的底层实际链表

- Set (集合)

是 String 类型的无序集合。它是通过 HashTable 来实现的。

- ZSet（sorted set:有序集合）

是 String 类型元素的结合，且不允许有重复元素

不同的是每个元素都会关联一个 double 类型的分数。

redis 正是通过分数来为集合中的成员进行从小到大的排序。zset 的成员是唯一的，但分数（score）却可以重复