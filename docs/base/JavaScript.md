# JS 

### 学习无处不在，只要有文本编辑器，就能编写 JavaScript 程序 --- 慕课

问题：js中有几个对象？

- JavaScript Array 对象
- JavaScript Boolean 对象
- JavaScript Date 对象
- JavaScript Math 对象
- JavaScript Number 对象 （对象是从此开始学习的）
- JavaScript String 对象
- JavaScript RegExp 对象
- JavaScript 全局对象(Functions)
- JavaScript 事件（Events）  


[js对象学习教程](http://www.w3school.com.cn/jsref/jsref_obj_array.asp "js对象")

### 6/11/2019 10:57:18 PM 
## Js基础

[TOC] 

### 准备
---
1. js的放置位置在head或者body中，一般情况下是放在head中。

![js位置](https://i.imgur.com/OCHQ7I4.png)

2. js注释分单行注释和多行注释。注释的作用想必都是清楚的吧！方便自己理解，也方便他人修改时快速阅读代码并能进行修改。

3. 变量：
![js变量](https://i.imgur.com/yUMWChh.png)

变量名可以任意取值，但是得遵循命名规则。

**命名规则：**

不能以数字开头 / 可以是任意的字母、数字、下划线或者美元符($) / 不能使用   JavaScript 关键词或者保留字。

**注意：** 

JS 区分大小写

变量虽然可以不声明，直接使用，但不规范，需要先声明，后使用。

4. 判断语句（if..else）
5. 函数

    `function 函数名（）{
		函数方法
    }`

6. 输出内容(document.write())

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
