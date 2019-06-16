[TOC]

# DOM 操作

1. DOM
文档对象模型 DOM (Document Object Model) 定义访问和处理 HTML 文档的标准方法。DOM 将 HTML 文档呈现为带有元素，属性和文本的树结构（节点树）。

![DOM](https://i.imgur.com/M1NZyLT.png)

HTML 文档有节点组成.三种常见的DOM节点：

+   元素节点： 标签
+   文本节点： 向用户展示的内容，如 `<li>..</li>`中的JavaScript，DOM，CSS等文本
+   属性节点： 元素属性，如 `<a>` 标签的链接属性等。
	
2. 通过 ID 获取元素

   `document.getElementById("id");`

3. innerHTML 属性

用于获取或者替换 HTML 内容。

   `语法：Object.innerHTML`

【此处应该有图的】

4. 改变 HTML 样式

语法：`Object.style.property =new style;`

注意:Object是获取的元素对象，如通过document.getElementById("id")获取的元素。

基本属性表:

5. 显示和隐藏 (display 属性)


    语法：Object.style.diaplay=value;

none:隐藏 & block:显示

6. 控制类名 (className 属性)

className 属性设置或者返回元素的 class 属性。

    语法：object.className = classname;

![className](https://i.imgur.com/psMpHGA.png)
