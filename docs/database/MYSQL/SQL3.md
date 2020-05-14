# SQL开发技巧3

## 如何在子查询中匹配两个值

子查询

- 能够避免数据重复问题
- 更加可读，更加容易理解。

```sql
select user_name
from user1 where id in(
select user_id from user_kills
);
```

**如果要使用连接进行查询的话，要注意数据重复问题！！！**

```sql
select distinct a.user_name
from user1 a join user_kills b on a.id=b.user_id;
```



需求：查询出每一个取经人打怪最多的日期，并列出取经人的姓名，打怪最后的日期和打怪数量。

MYSQl 中独有的**多列过滤方式**：

```sql
select a.user_name,b.timestr,kills
from user1 a join user_kills b on a.id=b.user_id
where (b.user_id,b.kills) in(
select user_id,max(kills)
from user_kills
group by user_id
)
```





## 解决统属性多值过滤问题

如何查询出同时具有变化和念经的人？

- join 方式

```sql
select a.user_name,b.kill,c.kill
from user1 a join user1_skills b on a.id =b.user_id
and b.skill = '念经' join user1_skills c on c.user_id = b.user_id
and c.skill = '变化'
where b.skill_level>0 and c.skill_level>0;
```

| user_name | skill | skill |
| --------- | ----- | ----- |
| 孙悟空    | 念经  | 变化  |
| 沙僧      | 念经  | 变化  |

如果要三个，四个，....N个技能呢？一直  join 下去吗？

如果 left join 之后加上 where 条件的话，会把 left join 变成 join。想要 left join 的话在 on 之后加上条件就可以了。

- Group  by

```sql
select a.user_name
from user1 a 
join user1_skills b on a.id=b.user_id
where b.skil in('念经','变化','腾云','浮水') and b.skil_level>0
group by a.user_name 
having count(*)>=2;
```

## 计算累进税类问题

个人所得税

查看所有人的纳税的总金额？

least() 函数  -- 返回列表中最小的值

```sql
select a.user_name,money,low,high,rate
from user1 a join taxRate b on a.money > b.low
order by user_name;
```



```sql
select user_name,money,low,hight
least(money-low,hight-low) as curmoney,rate
from user1 a join taxRate b on a.money>b.low
order by user_name,low;
```



```sql
select user_name,sum(curmoney*rate)
from (
select user_name,money,low,high.least(money-low,high-low) as curmoney,rate
from user1 a join taxRate b on a.money>b.low
) a
group by user_name;
```

