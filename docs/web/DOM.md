<!-- TOC -->
- [DOM操作](#DOM操作)
    - [初级知识](#初级知识)
    - [getElementsByName方法](#getElementsByName方法) 
    - [getElementsByTagName方法](#getElementsByTagName方法) 
    - [getAttribute方法](#getAttribute方法) 
    - [setAttribute方法](#setAttribute方法) 
    - [节点属性](#节点属性)
	    - [访问子节点childNodes](#访问子节点childNodes)
	    - [访问子节点的第一和最后项](#访问子节点的第一和最后项)
	    - [访问父节点parentNode](#访问父节点parentNode)
	    - [访问兄弟节点](#访问兄弟节点)
	    - [插入节点insertBefore](#插入节点insertBefore)
	    - [删除节点removeChild](#删除节点removeChild)
	    - [替换节点元素replaceChild](#替换节点元素replaceChild)
	    - [创建元素节点createElement](#创建元素节点createElement)
	    - [创建文本节点createTextNode](#创建文本节点createTextNode)
	    - [网页尺寸scrollHeight](#网页尺寸scrollHeight)
	    - [网页尺寸offsetHeight](#网页尺寸offsetHeight)
	    - [网页卷去的距离与偏移量](#网页卷去的距离与偏移量)
 
<!-- /TOC -->
# DOM 操作
---
## 初级知识
1. DOM
文档对象模型 DOM (Document Object Model) 定义访问和处理 HTML 文档的标准方法。DOM 将 HTML 文档呈现为带有元素，属性和文本的树结构（节点树）。

![DOM](https://i.imgur.com/M1NZyLT.png)

HTML 文档有节点组成.三种常见的DOM节点：

+   元素节点： 标签
+   文本节点： 向用户展示的内容，如 `<li>..</li>`中的JavaScript，DOM，CSS等文本
+   属性节点： 元素属性，如 `<a>` 标签的链接属性等。

[节点属性图片]


![遍历节点树](https://i.imgur.com/G6Wrjso.png)

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

[基本属性表]

5. 显示和隐藏 (display 属性)


    语法：Object.style.diaplay=value;

none:隐藏 & block:显示

6. 控制类名 (className 属性)

className 属性设置或者返回元素的 class 属性。

    语法：object.className = classname;

![className](https://i.imgur.com/psMpHGA.png)

---

###  getElementsByName方法

通过元素 name 属性查询元素，返回带有指定名称的节点对象的集合。

语法：`document.getElementsByName(name)`

注意：

1. 因为 name 属性可能不唯一，所以 getElementsByName() 方法返回的是元素的数组，而不是一个元素。

2. 和数组类似也有length属性，可以和访问数组一样的方法来访问，从 0 开始

###  getElementsByTagName方法

返回带有指定标签名的节点对象集合。返回元素的顺序是它们在文件中顺序

语法：`document.getElementsByTagName(Tagname)`

说明：

1. Tagname 是标签的名称，如p、a、img等标签名

2. 和数组类似也有length属性，可以和访问数组一样的方法来访问，从 0 开始

**getElementById ,getElementsByName ,getElementsByTagName 区别：**

![区别](https://i.imgur.com/olVbn5w.png)

注意：方法区分大小写！！！

### getAttribute方法

通过元素节点的属性名称获取属性的值

语法：`elementNode.getAttribute(name)`

说明：

1. elementNode：使用getElementById() 、getElementsByTagName() 等方法，获取到的元素节点。

2. name：要想查询的元素节点的属性名字

### setAttribute方法

增加一个指定名称和值得新属性或者把一个现有的属性设定为指定的值

语法：`elementNode.setAttribute(name,value);`

注意：

1.把指定的属性设置为指定的值。如果不存在具有指定名称的属性，该方法将创建一个新属性。

2.类似于getAttribute() 方法，setAttribute() 方法只能通过元素节点对象调用的函数。

### 节点属性

nodeName 属性：节点的名称，只读

元素节点的 nodeName 与标签名相同 / 属性节点的 nodeName 是属性的名称 / 本节点的 nodeName 永远是 #text /文档节点的 nodeName 永远是 #document

nodeValue 属性：节点的值

元素节点的 nodeValue 是 undefined 或 null / 文本节点的 nodeValue 是文本自身 / 文档节点的 nodeValue 是属性值

nodeType 属性：节点的类型，只读

#### 访问子节点childNodes

访问选定元素节点下的所有子节点的列表，返回的值可以看作是一个数组，具有length属性。如果选定的节点没有子节点，则该属性返回不包含节点的 NodeList

语法：`elementNode.childNodes`

#### 访问子节点的第一和最后项

firstChild 属性：

属性返回childNodes数组的第一个子节点。如果选定的节点没有子节点，则该属性返回NULL。

语法：`node.fristChild`

lastChild 属性：

属性返回childNodes数组的最后一个子节点。如果选定的节点没有子节点，则该属性返回NULL。

语法：`node.lastChild`

#### 访问父节点parentNode

获取指定节点的父节点.父节点只有一个

语法：`elementNode.parentNode`

#### 访问兄弟节点 

nextSibling 属性可返回某个节点之后紧跟的节点（处在同一个树层级中）。如果没有此节点，则返回 null

语法：`nodeObject.nextSibling`

previousSibing 属性可返回某个节点之前紧跟的节点（处在同一树层级中）。如果没有此节点，则返回 null

语法：`nodeObject.previousSibling`

#### 插入节点appendChild

在指定节点的最后一个子节点列表之后添加一个新的节点

语法： `appendChild(newnode)`

#### 插入节点insertBefore

在已有的子节点前插入一个新的节点

语法：`insertBefore(newnode,node);`

#### 删除节点removeChild

从子节点列表中删除某个节点。如删除成功，可返回被删除的节点，如失败，则返回 NULL

#### 替换节点元素replaceChild

子节点（对象）的替换。返回别替换对象的引用

语法：`node.replaceChild(newnode,oldnew);`

#### 创建元素节点createElement

创建元素节点，可返回一个 Element 对象

语法:`document.createElement(tagName);`

参数：tagName:字符串值，这个字符串用来指明创建元素的类型

注意：要与 appendChild() 或 insertBefore 方法联合使用，将元素显示在页面中

#### 创建文本节点createTextNode

创建新的文本节点，返回新创建的 Text 节点

语法: `document.createTextNode(data)`

参数：data: 字符串值，可规定此节点的文本

#### 浏览器窗口可视区域大小

获得浏览器窗口的尺寸（浏览器的视口，不包括工具栏和滚动条）的方法:

一、对于IE9+、Chrome、Firefox、Opera 以及 Safari：

-  window.innerHeight - 浏览器窗口的内部高度

-  window.innerWidth - 浏览器窗口的内部宽度

二、对于 Internet Explorer 8、7、6、5：

-  document.documentElement.clientHeight表示HTML文档所在窗口的当前高度。

-  document.documentElement.clientWidth表示HTML文档所在窗口的当前宽度。

或者

Document对象的body属性对应HTML文档的<body>标签

-  document.body.clientHeight

-  document.body.clientWidth

在不同浏览器都实用的 JavaScript 方案：

    var w= document.documentElement.clientWidth
      || document.body.clientWidth;
    var h= document.documentElement.clientHeight
      || document.body.clientHeight;

#### 网页尺寸scrollHeight

scrollHeight和scrollWidth，获取网页内容高度和宽度。

一、针对IE、Opera:

scrollHeight 是网页内容实际高度，可以小于 clientHeight。

二、针对NS、FF:

scrollHeight 是网页内容高度，不过最小值是 clientHeight。也就是说网页内容实际高度小于 clientHeight 时，scrollHeight 返回 clientHeight 。

三、浏览器兼容性

    var w=document.documentElement.scrollWidth
       || document.body.scrollWidth;
    var h=document.documentElement.scrollHeight
       || document.body.scrollHeight;
注意:区分大小写

scrollHeight和scrollWidth还可获取Dom元素中内容实际占用的高度和宽度。

#### 网页尺寸offsetHeight

offsetHeight和offsetWidth，获取网页内容高度和宽度(包括滚动条等边线，会随窗口的显示大小改变)。

一、值

offsetHeight = clientHeight + 滚动条 + 边框。

二、浏览器兼容性

    var w= document.documentElement.offsetWidth
    || document.body.offsetWidth;
    var h= document.documentElement.offsetHeight
    || document.body.offsetHeight;

#### 网页卷去的距离与偏移量

[网页卷去的距离与偏移量]

scrollLeft:设置或获取位于给定对象左边界与窗口中目前可见内容的最左端之间的距离 ，即左边灰色的内容。

scrollTop:设置或获取位于对象最顶端与窗口中可见内容的最顶端之间的距离 ，即上边灰色的内容。

offsetLeft:获取指定对象相对于版面或由 offsetParent 属性指定的父坐标的计算左侧位置 。

offsetTop:获取指定对象相对于版面或由 offsetParent 属性指定的父坐标的计算顶端位置 。

注意:

1. 区分大小写

2. offsetParent：布局中设置postion属性(Relative、Absolute、fixed)的父容器，从最近的父节点开始，一层层向上找，直到HTML的body。
