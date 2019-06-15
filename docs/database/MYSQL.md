# MYSQl #
## desc ##
    select t.*,a.user_name 
    from tbtransrecord t,t_user a 
    where a.user_id=t.user_id  
    ORDER BY opt_date desc,opt_time desc;
和

    select t.*,a.user_name 
    from tbtransrecord t,t_user a 
    where a.user_id=t.user_id  
    ORDER BY opt_date ,opt_time desc;

区别:

先按日期来分组再按时间来分组.会出现并不是你想要的效果(ORDER BY opt_date,opt_time desc).它实际上是 opt_ date asc, opt_time desc.所以并不会出现你想要的效果.

如果想要出现按日期和时间降序排列的话,就分开写.即 opt_date desc, opt_time desc.
## to _ char/ to _ date ##
Oracle中有to _char和to _date.但是MYSQL中没有.

+ DATE _ FORMAT(MYSQL) -- TO _ CHAR(ORACLE)

> DATE _ FORMAT(SYSDATE(),'%Y-%m-%d %H:%i:%s')

+ STR _ TO _ DATE(MYSQL) -- TO _ DATE(ORACLE)

> STR _ TO _ DATE(SYSDATE(),'%Y-%m-%d %H:%i:%s')
> 
注: 
> %Y：代表4位的年份 
> %y：代表2为的年份
 
> %m：代表月, 格式为(01……12)  
> %c：代表月, 格式为(1……12)
 
> %d：代表月份中的天数,格式为(00……31)  
> %e：代表月份中的天数, 格式为(0……31) 
 
> %H：代表小时,格式为(00……23)  
> %k：代表 小时,格式为(0……23)  
> %h： 代表小时,格式为(01……12)  
> %I： 代表小时,格式为(01……12)  
> %l ：代表小时,格式为(1……12)
  
> %i： 代表分钟, 格式为(00……59) 

> %r：代表 时间,格式为12 小时(hh:mm:ss [AP]M)  
> %T：代表 时间,格式为24 小时(hh:mm:ss) 

> %S：代表 秒,格式为(00……59)  
> %s：代表 秒,格式为(00……59) 


## drop,delete和truncate的区别

一次偶然的机会我看到尽然还有 truncate table .. 这样的写法。所以就产生了好奇心。想一探究竟！

1. 应用范围：delete 可以操作表和视图. truncate 只能操作表.

2. delete 和 truncate 只是删除数据， drop 删除数据和结构

3.执行速度：drop > truncate > drop

4.delete 删除每一行的时候都会生成事务操作记录保存在日志中，以便之后的回滚操作。

  truncate 删除数据的时候,并不会把删除操作记录记入日志中保存。删除行是不能恢复的，并且删除的过程中不会激活与表有关的删除触发器，所以执行速度快
  
5. 表和索引空间：

truncate ，恢复初始化大小；delete ，不会减少表或者索引所占用的空间；drop ，将表所占用的空间全部释放掉。

6. 对于有 FOREIGN KEY （外键）约束引用的表，不能使用 truncate table，而应该使用不带 where 子句的 delete 语句

7.truncate 和 drop 是 DLL ，操作立即生效，原数据不放到 rollback segment 中，不能回滚。delete 是 DML ，这个操作会放到 rollback segment 中，事务提交之后才生效。


[drop、truncate和delete的区别](https://www.cnblogs.com/zhizhao/p/7825469.html?tdsourcetag=s_pctim_aiomsg)
