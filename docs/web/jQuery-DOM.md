# jQuery - DOM
## DOM节点的创建
创建元素节点：$("<div></div>")
创建文本节点：$("<div>文本节点</div>")
创建属性节点：$("<div class='right'><div class='aaron'>动态创建DIV元素节点</div></div>")
## DOM节点的插入
### 内部插入append()与appendTo()

- append(content) ：向每个匹配的元素内部追加内容
- appendTo(content)：把所有匹配的元素追加到另一个指定的元素集合中

.append()和.appendTo()方法功能相同，主要的不同是语法 -- 内容和目标的位置不同。

append()前面是被插入的对象，后面是要在对象内插入的元素内容

appendTo()前面是要插入的元素内容，而后面是被插入的对象

### 外部插入afer()和before()

- .after(content)：在匹配元素集合中的每个元素后面插入参数所指定的内容，作为其兄弟节点。

- .before(content):据参数设定，在匹配元素的前面插入内容。

before与after都是用来对相对选中元素外部增加相邻的兄弟节点。

2个方法都是都可以接收HTML字符串，DOM 元素，元素数组，或者jQuery对象，用来插入到集合中每个匹配元素的前面或者后面。

2个方法都支持多个参数传递after(div1,div2,....)。

### 内部插入prepend()与prependTo()

- prepend：向每个匹配的元素内部前置内容。
- prependTo：把所有匹配的元素前置到另一个指定的元素集合中

区别:

1) .prepend()方法将指定元素插入到匹配元素里面作为它的第一个子元素 (如果要作为最后一个子元素插入用.append())

2) .prepend()和.prependTo()实现同样的功能，主要的不同是语法，插入的内容和目标的位置不同

3) 对于.prepend() 而言，选择器表达式写在方法的前面，作为待插入内容的容器，将要被插入的内容作为方法的参数,而.prependTo() 正好相反，将要被插入的内容写在方法的前面，可以是选择器表达式或动态创建的标记，待插入内容的容器作为参数。

内部操作的四个方法的区别：

- append()向每个匹配的元素内部追加内容
- prepend()向每个匹配的元素内部前置内容
- appendTo()把所有匹配的元素追加到另一个指定元素的集合中
- prependTo()把所有匹配的元素前置到另一个指定的元素集合中

### 外部插入insertAfter()与insertBefore()

- insertBefore：在目标元素前面插入集合中每个匹配的元素
- insertAfter：在目标元素后面插入结合中每个匹配的元素

1) .before()和.insertBefore()实现同样的功能。主要的区别是语法——内容和目标的位置。 对于before()选择表达式在函数前面，内容作为参数，而.insertBefore()刚好相反，内容在方法前面，它将被放在参数里元素的前面

2).after()和.insertAfter() 实现同样的功能。主要的不同是语法——特别是（插入）内容和目标的位置。 对于after()选择表达式在函数的前面，参数是将要插入的内容。对于 .insertAfter(), 刚好相反，内容在方法前面，它将被放在参数里元素的后面

3)before、after与insertBefore。insertAfter的除了目标与位置的不同外，后面的不支持多参数处理

## DOM节点的删除
### empty
清空方法，因为它只移除了指定元素中的所有子节点。这个方法不仅移除子元素（和其他后代元素），同样移除元素里的文本。因为，根据说明，元素里任何文本字符串都被看做是该元素的子节点。

<div class="hello"><p>hello</p></div>
如果我们通过empty方法移除里面div的所有元素，它只是清空内部的html代码，但是标记仍然留在DOM中

//通过empty处理
$('.hello').empty()

//结果：<p>hello</p>被移除
<div class="hello"></div>

### remove的有参和无参用法
remove 会将元素自身移除，同时也会移除元素内部的一切，包括绑定的事件及与该元素相关的 jQuery 数据。

remove 表达式参数：remove 比 empty 好用的地方就是可以传递一个选择器表达式用来过滤将移除的匹配元素集合，可以选择性的删除指定的节点。

$("p").filter(":contains('3')").remove()

### remove和empty的区别

empty方法：

严格地讲，empty()方法并不是删除节点，而是清空节点，它能清空元素中的所有后代节点
empty不能删除自己本身这个节点

remove方法：

该节点与该节点所包含的所有后代节点将同时被删除
提供传递一个筛选的表达式，删除指定合集中的元素

### detach方法
保留数据的删除操作。detach 方法是 jQuery 特有的，所以它只能处理通过 jQuery 的方法绑定的事件或者数据。


detach() 和 remove 的区别：

[图片]

## DOM节点的复制和替换
### 拷贝clone
.clone()方法深度 复制所有匹配的元素集合，包括所有匹配元素、匹配元素的下级元素、文字节点。

clone方法比较简单就是克隆节点，但是需要注意，如果节点有事件或者数据之类的其他处理，我们需要通过clone(ture)传递一个布尔值ture用来指定，这样不仅仅只是克隆单纯的节点结构，还要把附带的事件与数据给一并克隆了。

### 替换replaceWith()与repalceAll()
.replaceWith(newContent)：用提供的内容替换集合中所有匹配的元素并且返回被删除元素的集合。

.replaceAll(target)：用集合的匹配元素替换每个目标元素。

总结：

.replaceAll()和.replaceWith()功能类似，主要是目标和源的位置区别
.replaceWith()与.replaceAll() 方法会删除与节点相关联的所有数据和事件处理程序
.replaceWith()方法，和大部分其他jQuery方法一样，返回jQuery对象，所以可以和其他方法链接使用
.replaceWith()方法返回的jQuery对象引用的是替换前的节点，而不是通过replaceWith/replaceAll方法替换后的节点



## jQuery遍历
