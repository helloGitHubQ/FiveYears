## String
### 5/12/2019 8:18:58 PM 
+ 不可变的 String

String 对象是不可变的。查看 JDK 文档你就会发现，String类中的每一个看起来修改 String 值的方法，其实都是又创建一个全新的 String 对象。

不可变性会带来效率问题。

StringBuilder （Java SE5引入的）| StringBuffer (线程安全)

运行速度排行榜：
StringBuilder (1) - StringBuffer(2) - String(3)

所以：
String 适合少量的字符串操作。

StringBuffer 适合多线程下在字符缓冲区对字符串大量操作。

StringBuilder 适合单线程下在字符串缓冲区对字符串大量操作。

+ String 上的操作 (常用)

length() | charAt() | toCharArray() | equals() | contains() | startsWith() | endsWith() | indexOf() | lastIndexOf() | subString() | replace() | toLowerCase() | toUpperCase() | trim() | valueOf()等等

+ 格式化输出
	+ printf() 
	+ System.out.format() format 和 printf 是等价的。
	+ Formatter类  可以看成是一个翻译器
	+ Formatter转换（常见）
	
	![类型转换字符](https://i.imgur.com/EZNIsH0.png)
	+ String.format()

+ 正则表达式

**之后会有专门章节去讲述正则表达式，此处只是提一下几个小东西。**

参考JDK文档 java.util.regex 包中的 Pattern 类

字符类 / 量词 / Pattern和Matcher / 组(Groups) /start()和end() / split() / 替换操作 / reset

+ 扫描输入

Scanner类

delimiter()

Scanner的构造器能接受任何类型的输入对象.



