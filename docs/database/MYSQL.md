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
