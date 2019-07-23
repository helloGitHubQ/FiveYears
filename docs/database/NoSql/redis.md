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
---
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

### 常用五大数据类型
---
- Redis 键(key)

常用：

	key *
	exists key的名字，判断某个 key 是否存在
	move key  db   ---- 当前数据库就没有，移除了
	expire key 秒数  ---- 给指定 key 设置过期时间
	ttl key  ---- 查看还有多少秒过期， -1 表示永不过期，-2 表示已过期
	type key ---- 查看 key 是什么类型

[Redis keys 命令](https://www.runoob.com/redis/redis-keys.html)

- String （字符串）

是 redis 中最基本的数据类型，可以理解与Memcached 一模一样的类型，一个 key 对应一个 value。

是二进制安全的。意思是 redis 中 String 类型可以包含任何数据类型。比如 jpg 图片或者序列化

一个 Redis 中字符串中的value最多可以支持512M。

**单值单Value**

	set / get / del / append /strlen
	incr / decr / incrby /decrby ---- 一定要数字才能加减
    getrange(获取指定区间范围内的值，类似于between..and的关系；从零到负一表示全部。格式是 getrange key 开始 结束)
	setrange（设置指定区间范围内的值，格式是 setrange key 值 具体值）
	setex(set with expire) 键 秒值/setnx (set if not exist)
	mset / mget / msetnx

[Redis 字符串命令](https://www.runoob.com/redis/redis-strings.html)

- Hash (哈希，类似于Map集合)

键值对集合。

是一个 String 类型的 field 和 value 的映射表，hash 特别适合存储对象。

类似于 java 里面中 Map<String,Object>

KV模式不变，但V是一个键值对

常用：

	hset / hget / hmset / hmget / hgetall /hdel
	hlen
	hexists key  ---- 在key里面的某个值的key
	hkeys / hvals
	hincrby / hincrbyfloat
	hsetnx

[Redis hash 命令](https://www.runoob.com/redis/redis-hashes.html)

- List（列表）

是简单的字符串列表，按照插入顺序排序。你可以添加一个元素导列表的头部（左边）或者尾部（右边）

它的底层实际链表

**单值多 Value**

	lpush / rpush / lrange
	lpop / rpop
	lindex，按照索引下标获得元素（从上到下）
	len
	lrem key  删除N个value
	ltrim key 开始index 结束index  --- 截取指定范围的值后再复制给 key
	rpoplpush 源列表 目的列表
	lset key index value
	linsert key before/affter 值1 值2

总结：

	如果键不存在，创建新的链表
	如果建已存在，新增内容
	如果值全部被移除对应建也就消失了
	链表对头尾操作效率极高，如果对中间元素进行操作，效率就很低了

[Redis 列表命令](https://www.runoob.com/redis/redis-lists.html)

- Set (集合)

是 String 类型的无序集合。它是通过 HashTable 来实现的。

**单值多Value**

	sadd / smembers / slsmember
	scrad  ---- 获取集合里面的元素个数
	srem key value  ---- 删除集合中元素
	srandmember key 某个整数（随机出几个数）
	spop key 随机出栈
	smove key1 key2 在key1里某个值 --- 将key1里的某个值赋给key2
	数字集合类：差集(sdiff)和交集（sinter）并集（sunion）

[Redis 集合命令](https://www.runoob.com/redis/redis-sets.html)

- ZSet（sorted set:有序集合）

是 String 类型元素的结合，且不允许有重复元素

不同的是每个元素都会关联一个 double 类型的分数。

redis 正是通过分数来为集合中的成员进行从小到大的排序。zset 的成员是唯一的，但分数（score）却可以重复

	zadd / zrange  witchscores
	zrangebyscore key 开始sore 结束score  witchscores / ( 不包含 / Limit 作用是返回限制（limit 开始下标步 多少步）
	zrem key ---- 某个score下对应的value值，删除元素
	zcard/zcount key score区间 /zrank  key values值 ---- 获取下标值 /zscore key 对应值，获取分数
	zrevrabnk key values值 ----  逆序获取下标值
	zrevrange
	zrevrangebyscore key 

[Redis 有序集合命令](https://www.runoob.com/redis/redis-sorted-sets.html)