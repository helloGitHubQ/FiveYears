#正则表示式
---
### 5/14/2019 10:26:34 PM 
正则表达式是一种强大而灵活的文本处理工具。

正则表达式能干嘛呢？

1. 数据验证

2. 文本替换

3. 寻找字符串

---

- split()
- 
 一个非常有用的正则表示式工具。功能：就是将字符串从正则表达式匹配的地方分开。

它还有一个重载的版本，允许你限制字符串分割的次数。

- 替换 
- 
replaceFirst(String replacement) / replaceAll(String replacement ) /appendReplacement(StringBuffer sbuf,String replacement)

replaceFirst() 和 replaceAll() 只是替换普通字符串。

---

当你使用了字符类之后正则表达式的威力才真正显示出来！

---

- 量词
-
贪婪型(尽可能多的去匹配)

勉强型(匹配满足所需的最少字符)

占有型(Java中才可用)

![量词](https://i.imgur.com/3i7fk2L.png)


- Pattern 和 Matcher
- 
JDK文档 java.util.regex 包中的 Pattern 类。

![regex](https://i.imgur.com/xKUaIZk.png)

Pattern 表示编译后的正则表达式。

Matcher.find() 方法可用来在 CharSequence 中查找多个匹配。

start() 和 end() : start() 返回先前匹配的起始位置上的索引， end() 表示所匹配的最后字符的索引加一的值。
IllegalStateException(非法状态异常)

Pattern 标记（**在读JDK文档**）

reset() : 不带参数的 reset() 方法，可以将Matcher对象重新设置到当前字符序列的起始位置。

- 正则表达式和 Java I/O
-
在一个文件中进行搜素匹配操作。

Jeffery E.F.Firiedl 《精通正则表达式(第2版)》

---
[正则表达式教程](https://www.runoob.com/regexp/regexp-tutorial.html "正则表达式")