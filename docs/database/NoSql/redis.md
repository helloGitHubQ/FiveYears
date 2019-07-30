<!-- TOC -->
- [redis](#redis)
	- [NoSql](#NoSql)	
	- [redis](#redis)
		- [杂项基础知识](#杂项基础知识)
		- [常用五大数据类型](#常用五大数据类型)
		- [解析配置文件](#解析配置文件)
			- [它在哪](#它在哪)
			- [Unitls单元](#Unitls单元)
			- [INCLUDES包含](#INCLUDES包含)
			- [GENERAL通用](#GENERAL通用)
			- [SNAPSHOTTING快照](#SNAPSHOTTING快照)
			- [REPLICATION复制](#REPLICATION复制)
			- [SECURITY安全](#SECURITY安全)
			- [LIMITS限制](#LIMITS限制)
			- [APPEND_ONLY_MODE追加](#APPEND_ONLY_MODE追加)
			- [常见配置Redis.conf介绍](#常见配置Redis.conf介绍)
		- [持久化](#持久化)
			- [RDB](#RDB)
			- [AOF](#AOF)
			- [事务](#事务)
			- [消息订阅发布简介](#消息订阅发布简介)
#redis

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

### 解析配置文件
---
#### 它在哪
#### Unitls单元

- 配置大小单位，开头定义了一些基本的度量单位，只支持bytes,不支持bit
- 大小写不敏感

		# Redis configuration file example.
		#
		# Note that in order to read the configuration file, Redis must be
		# started with the file path as first argument:
		#
		# ./redis-server /path/to/redis.conf
		
		# Note on units: when memory size is needed, it is possible to specify
		# it in the usual form of 1k 5GB 4M and so forth:
		#
		# 1k => 1000 bytes
		# 1kb => 1024 bytes
		# 1m => 1000000 bytes
		# 1mb => 1024*1024 bytes
		# 1g => 1000000000 bytes
		# 1gb => 1024*1024*1024 bytes
		#
		# units are case insensitive so 1GB 1Gb 1gB are all the same.

#### INCLUDES包含

和 struts2 配置文件类似，可以通过 include 包含，redis.conf k可以作为总闸，包含其他的。

	################################## INCLUDES ###################################
	
	# Include one or more other config files here.  This is useful if you
	# have a standard template that goes to all Redis servers but also need
	# to customize a few per-server settings.  Include files can include
	# other files, so use this wisely.
	#
	# Notice option "include" won't be rewritten by command "CONFIG REWRITE"
	# from admin or Redis Sentinel. Since Redis always uses the last processed
	# line as value of a configuration directive, you'd better put includes
	# at the beginning of this file to avoid overwriting config change at runtime.
	#
	# If instead you are interested in using includes to override configuration
	# options, it is better to use include as the last line.
	#
	# include /path/to/local.conf
	# include /path/to/other.conf

#### GENERAL通用

[Redis配置 GENERAL通用]

	################################ GENERAL  #####################################
	
	# By default Redis does not run as a daemon. Use 'yes' if you need it.
	# Note that Redis will write a pid file in /var/run/redis.pid when daemonized.
	daemonize yes --改为no
	
	# When running daemonized, Redis writes a pid file in /var/run/redis.pid by
	# default. You can specify a custom pid file location here.
	pidfile /var/run/redis/redis-server.pid
	
	# Accept connections on the specified port, default is 6379.
	# If port 0 is specified Redis will not listen on a TCP socket.
	port 6379
	
	# TCP listen() backlog.
	#
	# In high requests-per-second environments you need an high backlog in order
	# to avoid slow clients connections issues. Note that the Linux kernel
	# will silently truncate it to the value of /proc/sys/net/core/somaxconn so
	# make sure to raise both the value of somaxconn and tcp_max_syn_backlog
	# in order to get the desired effect.
	tcp-backlog 511
	
	# By default Redis listens for connections from all the network interfaces
	# available on the server. It is possible to listen to just one or multiple
	# interfaces using the "bind" configuration directive, followed by one or
	# more IP addresses.
	#
	# Examples:
	#
	# bind 192.168.1.100 10.0.0.1
	bind 127.0.0.1
	
	# Specify the path for the Unix socket that will be used to listen for
	# incoming connections. There is no default, so Redis will not listen
	# on a unix socket when not specified.
	#
	# unixsocket /var/run/redis/redis.sock
	# unixsocketperm 700
	
	# Close the connection after a client is idle for N seconds (0 to disable)
	timeout 0
	
	# TCP keepalive.
	#
	# If non-zero, use SO_KEEPALIVE to send TCP ACKs to clients in absence
	# of communication. This is useful for two reasons:
	#
	# 1) Detect dead peers.
	# 2) Take the connection alive from the point of view of network
	#    equipment in the middle.
	#
	# On Linux, the specified value (in seconds) is the period used to send ACKs.
	# Note that to close the connection the double of the time is needed.
	# On other kernels the period depends on the kernel configuration.
	#
	# A reasonable value for this option is 60 seconds.
	tcp-keepalive 0
	
	# Specify the server verbosity level.
	# This can be one of:
	# debug (a lot of information, useful for development/testing)
	# verbose (many rarely useful info, but not a mess like the debug level)
	# notice (moderately verbose, what you want in production probably)
	# warning (only very important / critical messages are logged)
	loglevel notice
	# Note that to close the connection the double of the time is needed.
	# On other kernels the period depends on the kernel configuration.
	#
	# A reasonable value for this option is 60 seconds.
	tcp-keepalive 0
	
	# Specify the server verbosity level.
	# This can be one of:
	# debug (a lot of information, useful for development/testing)
	# verbose (many rarely useful info, but not a mess like the debug level)
	# notice (moderately verbose, what you want in production probably)
	# warning (only very important / critical messages are logged)
	loglevel notice
	
	# Specify the log file name. Also the empty string can be used to force
	# Redis to log on the standard output. Note that if you use standard
	# output for logging but daemonize, logs will be sent to /dev/null
	logfile /var/log/redis/redis-server.log
	
	# To enable logging to the system logger, just set 'syslog-enabled' to yes,
	# and optionally update the other syslog parameters to suit your needs.
	# syslog-enabled no
	
	# Specify the syslog identity.
	# syslog-ident redis
	
	# Specify the syslog facility. Must be USER or between LOCAL0-LOCAL7.
	# syslog-facility local0
	
	# Set the number of databases. The default database is DB 0, you can select
	# a different one on a per-connection basis using SELECT <dbid> where
	# dbid is a number between 0 and 'databases'-1
	databases 16

#### SNAPSHOTTING快照


- save

- stop-writes-on-bgsave-error 如果配置成no,表示你不在乎数据不一致或者有其他的手段发现和控制

- rdbcompression:对于存储到磁盘中的快照，可以设置是否进行压缩存储。如果是的话，redis会采用 LZF 算法进行压缩。如果你不想消耗 CPU 来进行压缩的话，可以设置为关闭此功能。

- rdbchecksum:在存储快照后，还可以让 redis 使用 CRC64 算法来进行数据校验，但是这样做会增加大的 10% 的性能消耗，如果希望获取到最大的性能提升，可以关闭此功能。

		################################ SNAPSHOTTING  ################################
		#
		# Save the DB on disk:
		#
		#   save <seconds> <changes>
		#
		#   Will save the DB if both the given number of seconds and the given
		#   number of write operations against the DB occurred.
		#
		#   In the example below the behaviour will be to save:
		#   after 900 sec (15 min) if at least 1 key changed
		#   after 300 sec (5 min) if at least 10 keys changed
		#   after 60 sec if at least 10000 keys changed
		#
		#   Note: you can disable saving completely by commenting out all "save" lines.
		#
		#   It is also possible to remove all the previously configured save
		#   points by adding a save directive with a single empty string argument
		#   like in the following example:
		#
		#   save ""
		
		save 900 1
		save 300 10
		save 60 10000
		
		# By default Redis will stop accepting writes if RDB snapshots are enabled
		# (at least one save point) and the latest background save failed.
		# This will make the user aware (in a hard way) that data is not persisting
		# on disk properly, otherwise chances are that no one will notice and some
		# disaster will happen.
		#
		# If the background saving process will start working again Redis will
		# automatically allow writes again.
		#
		# However if you have setup your proper monitoring of the Redis server
		# and persistence, you may want to disable this feature so that Redis will
		# continue to work as usual even if there are problems with disk,
		# permissions, and so forth.
		stop-writes-on-bgsave-error yes
		
		# Compress string objects using LZF when dump .rdb databases?
		#   Note: you can disable saving completely by commenting out all "save" lines.
		#
		#   It is also possible to remove all the previously configured save
		#   points by adding a save directive with a single empty string argument
		#   like in the following example:
		#
		#   save ""
		
		save 900 1
		save 300 10
		save 60 10000
		
		# By default Redis will stop accepting writes if RDB snapshots are enabled
		# (at least one save point) and the latest background save failed.
		# This will make the user aware (in a hard way) that data is not persisting
		# on disk properly, otherwise chances are that no one will notice and some
		# disaster will happen.
		#
		# If the background saving process will start working again Redis will
		# automatically allow writes again.
		#
		# However if you have setup your proper monitoring of the Redis server
		# and persistence, you may want to disable this feature so that Redis will
		# continue to work as usual even if there are problems with disk,
		# permissions, and so forth.
		stop-writes-on-bgsave-error yes
		
		# Compress string objects using LZF when dump .rdb databases?
		# For default that's set to 'yes' as it's almost always a win.
		# If you want to save some CPU in the saving child set it to 'no' but
		# the dataset will likely be bigger if you have compressible values or keys.
		rdbcompression yes
		
		# Since version 5 of RDB a CRC64 checksum is placed at the end of the file.
		# This makes the format more resistant to corruption but there is a performance
		# hit to pay (around 10%) when saving and loading RDB files, so you can disable it
		# for maximum performances.
		#
		# RDB files created with checksum disabled have a checksum of zero that will
		# tell the loading code to skip the check.
		rdbchecksum yes
		
		# The filename where to dump the DB
		dbfilename dump.rdb
		
		# The working directory.
		#
		# The DB will be written inside this directory, with the filename specified
		# above using the 'dbfilename' configuration directive.
		#
		# The Append Only File will also be created inside this directory.
		#
		# Note that you must specify a directory here, not a file name.
		dir /var/lib/redis

#### REPLICATION复制
#### SECURITY安全
访问密码的查看、设置和取消。

	################################## SECURITY ###################################
	
	# Require clients to issue AUTH <PASSWORD> before processing any other
	# commands.  This might be useful in environments in which you do not trust
	# others with access to the host running redis-server.
	#
	# This should stay commented out for backward compatibility and because most
	# people do not need auth (e.g. they run their own servers).
	#
	# Warning: since Redis is pretty fast an outside user can try up to
	# 150k passwords per second against a good box. This means that you should
	# use a very strong password otherwise it will be very easy to break.
	#
	# requirepass foobared
	
	# Command renaming.
	#
	# It is possible to change the name of dangerous commands in a shared
	# environment. For instance the CONFIG command may be renamed into something
	# hard to guess so that it will still be available for internal-use tools
	# but not available for general clients.
	#
	# Example:
	#
	# rename-command CONFIG b840fc02d524045429941cc15f59e41cb7be6c52
	#
	# It is also possible to completely kill a command by renaming it into
	# an empty string:
	#
	# rename-command CONFIG ""
	#
	# Please note that changing the name of commands that are logged into the
	# AOF file or transmitted to slaves may cause problems.

#### LIMITS限制

	################################### LIMITS ####################################
	
	# Set the max number of connected clients at the same time. By default
	# this limit is set to 10000 clients, however if the Redis server is not
	# able to configure the process file limit to allow for the specified limit
	# the max number of allowed clients is set to the current file limit
	# minus 32 (as Redis reserves a few file descriptors for internal uses).
	#
	# Once the limit is reached Redis will close all the new connections sending
	# an error 'max number of clients reached'.
	#
	# maxclients 10000
	
	# Don't use more memory than the specified amount of bytes.
	# When the memory limit is reached Redis will try to remove keys
	# according to the eviction policy selected (see maxmemory-policy).
	#
	# If Redis can't remove keys according to the policy, or if the policy is
	# set to 'noeviction', Redis will start to reply with errors to commands
	# that would use more memory, like SET, LPUSH, and so on, and will continue
	# to reply to read-only commands like GET.
	#
	# This option is usually useful when using Redis as an LRU cache, or to set
	# a hard memory limit for an instance (using the 'noeviction' policy).
	#
	# WARNING: If you have slaves attached to an instance with maxmemory on,
	# the size of the output buffers needed to feed the slaves are subtracted
	# from the used memory count, so that network problems / resyncs will
	# not trigger a loop where keys are evicted, and in turn the output
	# buffer of slaves is full with DELs of keys evicted triggering the deletion
	# of more keys, and so forth until the database is completely emptied.
	#
	# In short... if you have slaves attached it is suggested that you set a lower
	# limit for maxmemory so that there is some free RAM on the system for slave
	# output buffers (but this is not needed if the policy is 'noeviction').
	#
	# maxmemory <bytes>
	
	# MAXMEMORY POLICY: how Redis will select what to remove when maxmemory
	# is reached. You can select among five behaviors:
	#
	# volatile-lru -> remove the key with an expire set using an LRU algorithm
	# allkeys-lru -> remove any key according to the LRU algorithm
	# volatile-random -> remove a random key with an expire set
	# allkeys-random -> remove a random key, any key
	# volatile-ttl -> remove the key with the nearest expire time (minor TTL)
	# noeviction -> don't expire at all, just return an error on write operations
	#
	# Note: with any of the above policies, Redis will return an error on write
	#       operations, when there are no suitable keys for eviction.
	#
	#       At the date of writing these commands are: set setnx setex append
	#       incr decr rpush lpush rpushx lpushx linsert lset rpoplpush sadd
	#       sinter sinterstore sunion sunionstore sdiff sdiffstore zadd zincrby
	#       zunionstore zinterstore hset hsetnx hmset hincrby incrby decrby
	#       getset mset msetnx exec sort
	#
	# The default is:
	#
	# maxmemory-policy noeviction
	
	# LRU and minimal TTL algorithms are not precise algorithms but approximated
	# algorithms (in order to save memory), so you can tune it for speed or
	# accuracy. For default Redis will check five keys and pick the one that was
	# used less recently, you can change the sample size using the following
	# configuration directive.
	#
	# The default of 5 produces good enough results. 10 Approximates very closely
	# true LRU but costs a bit more CPU. 3 is very fast but not very accurate.
	#
	# maxmemory-samples 5

#### APPEND_ONLY_MODE追加

appendfsync:
1. Always :同步持久化每次发现数据变更会立即记录在磁盘中，性能比价差但是数据完整性好
2. Everysec： 出厂默认推荐，异步操作，每秒记录，如果一秒内宕（dang 四声）机，有数据丢失
3. NO 

no-appendfsync-on-rewrite:重写时是否可以御用 Appendfsync，用默认 no 即可，保证数据安全性

auto-aof-rewrite-percentage:设置重写的基准值

auto-aof-rewrite-min-size:设置重写的基准值

		############################## APPEND ONLY MODE ###############################
		
		# By default Redis asynchronously dumps the dataset on disk. This mode is
		# good enough in many applications, but an issue with the Redis process or
		# a power outage may result into a few minutes of writes lost (depending on
		# the configured save points).
		#
		# The Append Only File is an alternative persistence mode that provides
		# much better durability. For instance using the default data fsync policy
		# (see later in the config file) Redis can lose just one second of writes in a
		# dramatic event like a server power outage, or a single write if something
		# wrong with the Redis process itself happens, but the operating system is
		# still running correctly.
		#
		# AOF and RDB persistence can be enabled at the same time without problems.
		# If the AOF is enabled on startup Redis will load the AOF, that is the file
		# with the better durability guarantees.
		#
		# Please check http://redis.io/topics/persistence for more information.
		
		appendonly no
		
		# The name of the append only file (default: "appendonly.aof")
		
		appendfilename "appendonly.aof"
		
		# The fsync() call tells the Operating System to actually write data on disk
		# instead of waiting for more data in the output buffer. Some OS will really flush
		# data on disk, some other OS will just try to do it ASAP.
		#
		# Redis supports three different modes:
		#
		# no: don't fsync, just let the OS flush the data when it wants. Faster.
		# always: fsync after every write to the append only log. Slow, Safest.
		# everysec: fsync only one time every second. Compromise.
		#
		# The default is "everysec", as that's usually the right compromise between
		# speed and data safety. It's up to you to understand if you can relax this to
		# "no" that will let the operating system flush the output buffer when
		# it wants, for better performances (but if you can live with the idea of
		# some data loss consider the default persistence mode that's snapshotting),
		# or on the contrary, use "always" that's very slow but a bit safer than
		# everysec.
		#
		# More details please check the following article:
		# http://antirez.com/post/redis-persistence-demystified.html
		#
		# If unsure, use "everysec".
		
		# appendfsync always
		appendfsync everysec
		# appendfsync no
		
		# When the AOF fsync policy is set to always or everysec, and a background
		# saving process (a background save or AOF log background rewriting) is
		# performing a lot of I/O against the disk, in some Linux configurations
		# Redis may block too long on the fsync() call. Note that there is no fix for
		# this currently, as even performing fsync in a different thread will block
		# our synchronous write(2) call.
		#
		# In order to mitigate this problem it's possible to use the following option
		# that will prevent fsync() from being called in the main process while a
		# BGSAVE or BGREWRITEAOF is in progress.
		#
		# This means that while another child is saving, the durability of Redis is
		# the same as "appendfsync none". In practical terms, this means that it is
		# possible to lose up to 30 seconds of log in the worst scenario (with the
		# default Linux settings).
		#
		# If you have latency problems turn this to "yes". Otherwise leave it as
		# "no" that is the safest pick from the point of view of durability.
		
		no-appendfsync-on-rewrite no
		
		# Automatic rewrite of the append only file.
		# Redis is able to automatically rewrite the log file implicitly calling
		# BGREWRITEAOF when the AOF log size grows by the specified percentage.
		#
		# This is how it works: Redis remembers the size of the AOF file after the
		# latest rewrite (if no rewrite has happened since the restart, the size of
		# the AOF at startup is used).
		#
		# This base size is compared to the current size. If the current size is
		# bigger than the specified percentage, the rewrite is triggered. Also
		# you need to specify a minimal size for the AOF file to be rewritten, this
		# is useful to avoid rewriting the AOF file even if the percentage increase
		# is reached but it is still pretty small.
		#
		# Specify a percentage of zero in order to disable the automatic AOF
		# rewrite feature.
		
		auto-aof-rewrite-percentage 100
		auto-aof-rewrite-min-size 64mb
		
		# An AOF file may be found to be truncated at the end during the Redis
		# startup process, when the AOF data gets loaded back into memory.
		# This may happen when the system where Redis is running
		# crashes, especially when an ext4 filesystem is mounted without the
		# data=ordered option (however this can't happen when Redis itself
		# crashes or aborts but the operating system still works correctly).
		#
		# Redis can either exit with an error when this happens, or load as much
		# data as possible (the default now) and start if the AOF file is found
		# to be truncated at the end. The following option controls this behavior.
		#
		# If aof-load-truncated is set to yes, a truncated AOF file is loaded and
		# the Redis server starts emitting a log to inform the user of the event.
		# Otherwise if the option is set to no, the server aborts with an error
		# and refuses to start. When the option is set to no, the user requires
		# to fix the AOF file using the "redis-check-aof" utility before to restart
		# the server.
		#
		# Note that if the AOF file will be found to be corrupted in the middle
		# the server will still exit with an error. This option only applies when
		# Redis will try to read more data from the AOF file but not enough bytes
		# will be found.
		aof-load-truncated yes

#### 常见配置Redis.conf介绍

[常见配置 Redis.conf介绍](https://www.evernote.com/l/AjjinnX9k1dNibHGsGYfNfHdGUEhclsOeaQ/)	

### 持久化
---

#### RDB

**(Redis DataBase)**

- 官网介绍

- 是什么

在指定的时间间隔内将内存中的数据集快照写入磁盘，也就是行话讲的 Snapshot 快照，它恢复时将快照文件直接读到内存里

Redis 会单独创建(fork)一个子进程来进行持久化，会先将数据写入到一个临时文件中，待持久化结束了，再用这个临时文件替换上次持久化好的文件。

整个过程中，主进程是不进行任何 IO 操作的，这确保了极高的性能。

如果需要进行大规模数据的恢复，且对于数据恢复的完整性不是非常敏感，那 RDB 方式要比 AOF 方式更加的高效。RDB 的缺点是最后一次持久化后的数据可能丢失。

- Fork 

作用是复制一个与当前进程一样的进程。新进程的所有数据（变量，环境变量，程序计数器等）数值都和原进程一致，但是是一个全新的进程，并非为原进程的子进程。

- Rdb 保存的是 dump.rdb 文件

- 配置位置

- 如何触发 RDB 快照

		配置文件中默认的快照配置
		- 冷拷贝后重新使用 （从主机拷贝到备用主机上），可以 cp dump.rdb dump_new.rdb
		
		
		命令 save 或者是 bgsave
		- save时只管保存，其他不管，全部阻塞
		- bgsave:Redis 会在后台异步进行快照操作，快照同时还可以响应客户端请求。可以通过 lastsave 命令获取最后一次成功执行快照的时间
		
		执行 flushall 命令，也会产生 dump.rdb 文件，但里面是空的，无意义

- 如何恢复

将备份文件（dump.rdb）移动到 Redis 安装目录并启动服务即可。（config get dir 获取目录）

- 优势

适合大规模的数据恢复

对数据完整性和一致性要求不高

- 劣势

在一定间隔时间做一次准备，所以如果 redis 意外 down 掉的话，就会丢失最后一次快照后的所有的修改

Fork 的时候，内存中的数据被克隆了一份，大致2倍的膨胀性需要考虑

- 如何停止

动态所有停止 RDB 保存规则的方法： `redis-cli config set save ""`

#### AOF

**(Append Only File)**

- 官网介绍

- 是什么

**以日志的形式来记录每个写操作。**将 Redis 执行的所有写指令下来（读操作不记录），只许追加文件但不可以改写文件， Redis 启动之初会读取文件重新构建数据，换言之， redis 重启的话就根据日志文件的内容将写指令从前到后执行一次以完成数据的恢复工作

- aof 保存的是 appendonly.aof文件

- 配置文件

- aof 启动、修复、恢复

**正常恢复：**

	启动：设置 YES(修改默认的appendonly no 改为 yes)
	将有数据的 aof 文件复制一份保存到对应的目录(config get dir)
	恢复：重启 redis 然后重新加载

**异常恢复：**

	启动：设置YES(修改默认的appendonly no 改为 yes)
	备份被写坏的 AOF文件
	修复： redis-check-aof  --flx 进行修复
	恢复：重启 redis 然后重新加载 

- Rewrite

是什么：

AOF 采用文件追加方式，文件会越来越大为避免出现此种情况，新增了重写机制。当 AOF 文件的大小超过所设定的阀门值时，Redis 就会启动 AOF 文件的内容压缩，只保留可以恢复数据的最小指令集，可以使用命令 bgrewriteaof


重写原理：

AOF文件持续增长而过大时，会fork出一条新进程来讲文件重写（也是先写临时文件最后再 rename）,遍历新进车的内存中数据，每条记录有一条 set 语句。重写 aof 文件的操作，并没有读取旧的 aof 文件，而是将整个内存中的数据库内容用命令的方式重写一个新的 aof 文件，这点和快照有点类似。

触发机制：

Redis 会记录上次重写时的 AOF 大小，默认配置是当 AOF 文件大小时上次 rewrite 后大小的一倍且文件大于 64M 时触发

- 优势

		每秒同步：appendfsync always :同步持久化每次发现数据变更会立即记录在磁盘中，性能比价差但是数据完整性好
		每修改同步：appendfsync  Everysec： 出厂默认推荐，异步操作，每秒记录，如果一秒内宕（dang 四声）机，有数据丢失
		不同步：appendfsync no 从不同步

- 劣势

	相同数据集的数据而言 aof 文件远远大于 rdb 文件，恢复速度慢于 rdb
	aof 运行效率要慢于 rdb,每秒同步策略效率较好，不同步效率和 rdb 相同

### 事务
---

**(暂时不太懂)**

- 是什么

可以一次执行多个命令，本质是一组命令的集合，一个事务中的所有命令都会序列化。按顺序地串行化执行而不会被其它命令插入，不许加塞。

- 能干嘛

一个队列中，一次性、顺序型、排他性的执行一系列命令

- 怎么玩

常用命令:

[Redis 事务命令](https://www.runoob.com/redis/redis-transactions.html)

case1:正常执行

case2:放弃事务

case3:全体连坐

case4:冤头债主

case5:watch 监控

	乐观锁/悲观锁/CAS（check And Set）
	初始化信用卡可用余额和欠款
	无加塞篡改，先监控再开启 multi，保证两笔金额变动在同一个事务。
	有加塞篡改
	unwatch
	一旦执行了exec之前加的监控锁都会被取消掉了

- 3阶段

		开启：以MULTI开始一个事务
		入队：将多个命令入队到事务中，接到这些命令并不会立即执行，而是放在等待执行的事务队列里面
		执行：由 exec 命令触发事务

- 3特性


	单独的隔离操作：事务中的所有命令都会序列化、按照顺序地执行。事务在执行的过程中，不会被其他客户端发送来的命令请求所打断。
	没有隔离级别的概念：队列中的命令没有提交之前都不会实际的被执行，因为事务提交前任何指令都不会被实际执行，也就不存在事务内的查询要看到事务里的更新，在事务外查询补鞥看到这个让人万分头疼的问题。
	不保证原子性：redis 同一事务中如果有一条命令执行失败，其后的命令仍然会被执行，没有回滚。

### 消息订阅发布

进程间的一种消息通信模式：发送者（pub）发送消息，接受者（sub）接受消息。

命令：

[Redis 发布订阅命令](https://www.runoob.com/redis/redis-pub-sub.html)

### 复制(Master/Slave)

