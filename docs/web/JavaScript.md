### 6/11/2019 10:57:18 PM 
## Js基础

1. js的放置位置在head或者body中，一般情况下是放在head中。

![js位置](https://i.imgur.com/OCHQ7I4.png)

2. js注释分单行注释和多行注释。注释的作用想必都是清楚的吧！方便自己理解，也方便他人修改时快速阅读代码并能进行修改。

### 变量：

![js变量](https://i.imgur.com/yUMWChh.png)

变量名可以任意取值，但是得遵循命名规则。

**命名规则：**

不能以数字开头 / 可以是任意的字母、数字、下划线或者美元符($) / 不能使用   JavaScript 关键词或者保留字。

**注意：** 

JS 区分大小写

变量虽然可以不声明，直接使用，但不规范，需要先声明，后使用。

### 函数

    `function 函数名（）{
		函数方法
    }`

#### 函数调用：

函数定义好之后，是不能自动执行的，需要调用它，直接在需要的位置写函数名.

在`<script>`标签中调用

在 HTML 文件中调用

#### 有参数的函数：

参数可以有多个，根据需要增减参数个数。参数之间用逗号（,）
隔开

#### 返回值的函数：

函数中参数的返回值不只是数字，还可以是字符串等其他类型。

### 事件

JavaScript 创建动态页面。事件是可以被 JavaScript 侦测到的行为。网页中的每个元素都可以产生某些可以触发 JavaScript 函数或程序的事件。

![事件](https://i.imgur.com/EMx304v.png)

- onclick(鼠标单击事件)：当在网页上单击鼠标时，就会发生该事件。同时 onclick 事件调用的程序块就会被执行，通常与按钮一起使用。
- onmouseover(鼠标经过事件)：当鼠标移到一个对象上时，该对象就触发 onmouseover 事件，并执行 onmouseover 事件调用的程序
-  onmouseout(鼠标移开事件)：当鼠标移开当前对象时，执行 onmouseout 调用的程序。
-  onfocus(光标聚焦事件)：当网页中对象获得聚点时，执行 onfocus 调用的程序就会被执行。
-  onblur(失焦事件)：onblur事件与onfocus是相对事件，当光标离开当前获得聚焦对象的时候，触发onblur事件，同时执行被调用的程序。
-  onselect(内容选中事件)：当文本框或者文本域中的文字被选中时，触发onselect事件，同时调用的程序就会被执行。
-  onchange(文本框内容改变事件)：通过改变文本框的内容来触发onchange事件，同时执行被调用的程序。
-  onload(加载事件)：事件会在页面加载完成后，立即发生，同时执行被调用的程序。

注意：

1.加载页面时，触发 onload 事件，事件写在` <body>`标签内

2.此节的加载页面可以理解为打开一个新页面。

- onunload(卸载事件)：当用户退出页面时（页面关闭，页面刷新等），触发 onUnload 事件，同时执行被调用的程序。



### 输出内容(document.write())

+ 输出内容用""括起直接输出
+ 通过变量输出内容
+ 输出多项内容，内容之间用+号
+ 输出 HTML 并起作用，标签使用 "" 括起来

### 6/12/2019 8:06:47 PM 

### 互动
---

7. 警告 -- alert 消息对话框

	`alert(字符串或者常量)`
8. 确认 -- confirm 消息对话框

![confirm](https://i.imgur.com/1R2A7vU.png)
	
对话框是排他的，即用户在点击对话框之前不能进行任何其他操作。

9. 提问 -- prompt 消息对话框

![prompt](https://i.imgur.com/dMWVmWH.png)

10. 打开新窗口 window.open()

![open](https://i.imgur.com/wweNk5G.png)

![open](https://i.imgur.com/zutZfNX.png)

11. 关闭窗口 window.close()

![close](https://i.imgur.com/pWbMyvV.png)

[js学习教程](http://www.w3school.com.cn/b.asp "js")

### 6/13/2019 10:06:36 PM 

---
### 表达式：

![js表达式](https://i.imgur.com/1KrQBy0.png)

### 操作符：

`+` 号不只代表加法，还可以连接两个字符串。

    ++ 自加一|-- 自减一

比较操作符：< | > | <= | >= | == |！=

逻辑操作符： &&(逻辑与)  ||(逻辑或)  !(逻辑非)

操作符优先级：（从高到底）

算数操作符--比较操作符--逻辑操作符--"="赋值符号

### 数组：

#### 创建数组语法：

    var myarray=new Array();

注意：

1) 创建的新数组是空数组，没有值。如果输出会显示undefined。

2) 虽然创建数组时，指定了长度，但实际上数组都是变长的。也就是说即使指定了长度8，仍然可以将元素存储在规定长度外。

#### 数组赋值：

    var myarry = new Array();
	myarry[0] = 66;
    myarry[1] = 77;
    myarry[2] = 88;
 
    var myarry = new Array(66,77,88);
    
    var myarry = [66,77,88];

注意：

数组存储的数据可以是任何类型。	

#### 添加新元素

#### 使用数组元素

#### 数组属性 length:

    myarray.length;
注意：
 
因为数组的索引总是从0开始的，所有数组的上下线是 0 和 length-1;
 
同时 js 数组的 length 属性是可变的。

#### 二维数组：

    二维数组表示： myarry[][]

    var myarrays=[[0,1,2],[0,1,2]];

### 流程控制语句

if语句

if..else 语句

if..else 嵌套语句

switch 语句：

语法说明：switch 必须初始值，值与每个 case 值匹配。满足该 case
后执行所有语句，并用 break 语句来阻止运行下一个 case .如所有 case 都不匹配，执行 default 后的语句.

for 循环

while 循环

do..while 循环

break

continue