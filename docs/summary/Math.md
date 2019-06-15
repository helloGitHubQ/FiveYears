# Math
今天我们来看看 java 中的 Math 函数.

![Math1](https://i.imgur.com/ymssY3I.png)


![Math2](https://i.imgur.com/gAoJ48f.png)

![Math3](https://i.imgur.com/LjrHHIc.png)

**常量：**E / PI

**函数：**
正弦,余弦,正切 | 反正弦，反余弦，反正切 | 弧度转为角度 | 角度转为弧度

向上取整（逢余进一），向下取整（逢余舍一），求余（IEEEremainder）

指数，log，log10，开方，开立方,绝对值，最大值，最小值，a的b次方，四舍五入，随机数等等

常用的 Math 函数：

- 算数计算
	- Math.sqrt():计算平方根
	- Math.cbrt():计算立方根
	- Math.pow(a,b):计算 a 的 b 次方( double )
	- Math.max(a,b):计算最大值（ float , double , int , long ）
	- Math.min(a,b):计算最小值（ float , double , int , long ）  
	- Math.abs():计算绝对值
- 进位
	- Math.ceil():天花板，逢余进一
	- Math.floor():地板，逢余舍一
	- Math.rint():四舍五入，返回 double 值，注意： 5的时候会取偶数
	- Math.round():四舍五入 
- 随机
	- Math.random():取得一个[0,1)	范围的随机数。
	System.out.println(Math.random()); // [0, 1)的double类型的数
    System.out.println(Math.random() * 2);//[0, 2)的double类型的数
    System.out.println(Math.random() * 2 + 1);// [1, 3)的double类型的数

[参考文章](https://blog.csdn.net/xuexiangjys/article/details/79849888 "Math函数")