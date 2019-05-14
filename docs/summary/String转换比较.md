(String)和+""和.toString()的区别:
---
### 5/11/2019 10:06:11 AM ###

**相同点：** 都是进行类型转换。

+ (String)

(String)是属于强制转换(向下转型)的。如果转换失败的话会抛出ClassCastException。


+ +" "

任何对象都可以通过它来转换为String类型。***待完善***

+ .toString()

.toString(),是Object中的方法，所有对象又继承Object。

![toString](https://i.imgur.com/KVVGV2A.png)

所以.toString()是所有对象都有的方法。

例子：
int类型转化为String类型：通过 +" "转化。

BigDecimal转化为String类型：通过.toString()转化。也可通过 +" "转化。

![例子](https://i.imgur.com/PPPu5q5.png)
 