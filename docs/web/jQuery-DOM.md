<!-- TOC -->
- [jQuery-DOM](#jQuery-DOM)
	- [DOM节点的创建](#DOM节点的创建)
    - [DOM节点的插入](#DOM节点的插入)
	    - [内部插入append()与appendTo()](#内部插入append()与appendTo())
	    - [外部插入afer()和before()](#外部插入afer()和before())
	    - [内部插入prepend()与prependTo()](#内部插入prepend()与prependTo())
	    - [外部插入insertAfter()与insertBefore()](#外部插入insertAfter()与insertBefore())
    - [DOM节点的删除](#DOM节点的删除) 
	    - [empty](#empty)
	    - [remove的有参和无参用法](#remove的有参和无参用法)
	    - [remove和empty的区别](#remove和empty的区别)
	    - [detach方法](#detach方法)
	- [DOM节点的复制和替换](#DOM节点的复制和替换)
		- [拷贝clone](#拷贝clone)
		- [替换replaceWith()与repalceAll()](#替换replaceWith()与repalceAll())
		- [包裹warp()方法](#包裹warp()方法)
		- [包裹unwrap()方法](#包裹unwrap()方法)
		- [包裹warpAll()方法](#包裹warpAll()方法)
		- [包裹wrapInner()方法](#包裹wrapInner()方法)
	- [jQuery遍历](#jQuery遍历)
		- [children()方法](#children()方法) 
		- [find()方法](#find()方法) 
		- [parent()方法](#parent()方法) 
		- [parents()方法](#parents()方法) 
		- [closest()方法](#closest()方法) 
		- [next()方法](#next()方法) 
		- [prev()方法](#prev()方法) 
		- [siblings()方法](#siblings()方法) 
		- [add()方法](#add()方法) 
		- [each()方法](#each()方法) 
<!-- /TOC -->
# jQuery-DOM
## DOM节点的创建
创建元素节点：`$("<div></div>")`

创建文本节点：`$("<div>文本节点</div>")`

创建属性节点：`$("<div class='right'><div class='aaron'>动态创建DIV元素节点</div></div>")`
## DOM节点的插入
### 内部插入append()与appendTo()
- append(content) ：向每个匹配的元素内部追加内容
- appendTo(content)：把所有匹配的元素追加到另一个指定的元素集合中

**区别：**.append()和.appendTo()方法功能相同，主要的不同是语法 -- 内容和目标的位置不同。

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

1) .prepend() 方法将指定元素插入到匹配元素里面作为它的第一个子元素 (如果要作为最后一个子元素插入用.append())

2) .prepend() 和.prependTo() 实现同样的功能，主要的不同是语法，插入的内容和目标的位置不同

3) 对于.prepend() 而言，选择器表达式写在方法的前面，作为待插入内容的容器，将要被插入的内容作为方法的参数,而.prependTo() 正好相反，将要被插入的内容写在方法的前面，可以是选择器表达式或动态创建的标记，待插入内容的容器作为参数。

内部操作的四个方法的区别：

- append() 向每个匹配的元素内部追加内容
- prepend() 向每个匹配的元素内部前置内容
- appendTo() 把所有匹配的元素追加到另一个指定元素的集合中
- prependTo() 把所有匹配的元素前置到另一个指定的元素集合中

### 外部插入insertAfter()与insertBefore()

- insertBefore：在目标元素前面插入集合中每个匹配的元素
- insertAfter：在目标元素后面插入结合中每个匹配的元素

1) .before()和.insertBefore()实现同样的功能。主要的区别是语法——内容和目标的位置。 对于before()选择表达式在函数前面，内容作为参数，而.insertBefore()刚好相反，内容在方法前面，它将被放在参数里元素的前面

2) .after()和.insertAfter() 实现同样的功能。主要的不同是语法——特别是（插入）内容和目标的位置。 对于after()选择表达式在函数的前面，参数是将要插入的内容。对于 .insertAfter(), 刚好相反，内容在方法前面，它将被放在参数里元素的后面

3) before、after与insertBefore。insertAfter的除了目标与位置的不同外，后面的不支持多参数处理

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

- 该节点与该节点所包含的所有后代节点将同时被删除
- 提供传递一个筛选的表达式，删除指定合集中的元素

### detach方法
保留数据的删除操作。detach 方法是 jQuery 特有的，所以它只能处理通过 jQuery 的方法绑定的事件或者数据。


detach() 和 remove 的区别：

[图片]

## DOM节点的复制和替换
### 拷贝clone
.clone()方法深度 复制所有匹配的元素集合，包括所有匹配元素、匹配元素的下级元素、文字节点。

clone方法比较简单就是克隆节点，但是需要注意，如果节点有事件或者数据之类的其他处理，我们需要通过clone(ture)传递一个布尔值ture用来指定，这样不仅仅只是克隆单纯的节点结构，还要把附带的事件与数据给一并克隆了。

### 替换replaceWith()与repalceAll()
- .replaceWith(newContent)：用提供的内容替换集合中所有匹配的元素并且返回被删除元素的集合。

- .replaceAll(target)：用集合的匹配元素替换每个目标元素。

总结：

- .replaceAll()和.replaceWith()功能类似，主要是目标和源的位置区别
- .replaceWith()与.replaceAll() 方法会删除与节点相关联的所有数据和事件处理程序
- .replaceWith()方法，和大部分其他jQuery方法一样，返回jQuery对象，所以可以和其他方法链接使用
- .replaceWith()方法返回的jQuery对象引用的是替换前的节点，而不是通过replaceWith/replaceAll方法替换后的节点

### 包裹warp()方法

- .warp(wrappingElement)：在集合中匹配的每个元素周围包裹一个 HTML 结构

简单的看一段代码：

    <p>p元素</p>
给p元素增加一个div包裹

    $('p').wrap('<div></div>')
最后的结构，p元素增加了一个父div的结构

	<div>
	    <p>p元素</p>
	</div>

- .warp(function)：一个回调函数，返回用于包裹匹配元素的 HTML 内容或 jQuery 对象

	$('p').wrap(function() {
	    return '<div></div>';   //与第一种类似，只是写法不一样
	})

注意：

.wrap() 函数可以接受任何字符串或对象，可以传递给 $() 工厂函数来指定一个 DOM 结构。这种结构可以嵌套了好几层深，但应该只包含一个核心的元素。每个匹配的元素都会被这种结构包裹。该方法返回原始的元素集，以便之后使用链式方法。

### 包裹unwrap()方法
显而言之， unwrap() 方法是与 wrap（）方法相反的。将匹配元素集合的父级元素删除，保留自身（和兄弟元素，如果存在的话）在原来的位置。

看一段简单案例：

	<div>
	    <p>p元素</p>
	</div>
我要删除这段代码中的div，一般常规的方法会直接通过remove或者empty方法

    $('div').remove();
但是如果我还要保留内部元素p，这样就意味着需要多做很多处理，步骤相对要麻烦很多，为了更便捷，jQuery提供了unwrap方法很方便的处理了这个问题

    $('p').unwrap();
找到p元素，然后调用unwrap方法，这样只会删除父辈div元素了

结果：

    <p>p元素</p>

### 包裹warpAll()方法
wrap 是针对单个 dom 元素处理，如果要将集合中的元素用其他元素包裹起来，也就是给他们增加一个父元素。

- .wrapAll(wrappingElement)：给集合中匹配的元素增加一个外面包裹的 HTML 结构

简单的看一段代码：
	
	<p>p元素</p>
	<p>p元素</p>
给所有p元素增加一个div包裹

    $('p').wrapAll('<div></div>')
最后的结构，2个P元素都增加了一个父div的结构

	<div>
	    <p>p元素</p>
	    <p>p元素</p>
	</div>

- .wrapAll(function)：一个回调函数，返回用于包裹匹配元素的 HTML 内容或 jQuery 对象。通过回调方式可以单独处理每一个元素。

以上面案例为例，

	$('p').wrapAll(function() {
	    return '<div><div/>'; 
	})
以上的写法的结果如下，等同于warp的处理了

	<div>
	    <p>p元素</p>
	</div>
	<div>
	    <p>p元素</p>
	</div>

注意：

.wrapAll()函数可以接受任何字符串或对象，可以传递给$()工厂函数来指定一个DOM结构。这种结构可以嵌套多层，但是最内层只能有一个元素。所有匹配元素将会被当作是一个整体，在这个整体的外部用指定的 HTML 结构进行包裹。

### 包裹wrapInner()方法
如果要将合集中的元素内部所有的子元素用其他元素包裹起来，并当作指定元素的子元素。

- .wrapInner(wrappingElement)：给集合中匹配的元素的内部，增加包裹的 HTML 结构。

可以用个简单的例子描述下，简单的看一段代码：

	<div>p元素</div>
	<div>p元素</div>
给所有元素增加一个p包裹

    $('div').wrapInner('<p></p>')
最后的结构，匹配的di元素的内部元素被p给包裹了

	<div>
	    <p>p元素</p>
	</div>
	<div>
	    <p>p元素</p>
	</div>
- .wrapInner(function)：允许我们用一个 callback 函数做参数，每次遇到匹配元素时，该函数被执行。返回一个 DOM 元素，jQuery  对象或HTML片段，用来包住匹配元素的内容。

以上面案例为例，

	$('div').wrapInner(function() {
	    return '<p></p>'; 
	})
以上的写法的结果如下，等同于第一种处理了

	<div>
	    <p>p元素</p>
	</div>
	<div>
	    <p>p元素</p>
	</div>

 当通过一个选择器字符串传递给.wrapInner() 函数，其参数应该是格式正确的 HTML，并且 HTML 标签应该是被正确关闭的。
## jQuery遍历
### children()方法
快速在合集中找到第一个元素。children(selector)方法是返回匹配元素集合中每一个元素的子元素。

- children()无参数

允许我们通过在DOM树中对这些元素的直接子元素进行搜索，并且构造一个新的匹配元素的jQuery对象

**注意：**jQuery是一个合集对象，所以通过children是匹配合集中每一给元素的第一级子元素

.children()方法选择性地接受同一类型选择器表达式

    $("div").children(".selected")
同样的也是因为jQuery是合集对象，可能需要对这个合集对象进行一定的筛选，找出目标元素，所以允许传一个选择器的表达式。

### find()方法
快速查找 DOM 树上的后代元素。children 是父子关系查找，find() 是后代关系（包含父子关系）。

理解节点查找关系：

	<div class="div">
	    <ul class="son">
	        <li class="grandson">1</li>
	    </ul>
	</div>
代码如果是`$("div").find("li")`，此时，li与div是祖辈关系，通过find方法就可以快速的查找到了。

.find()方法要注意的知识点：

- find是遍历当前元素集合中每个元素的后代。只要符合，不管是儿子辈，孙子辈都可以。
- 与其他的树遍历方法不同，选择器表达式对于 .find() 是必需的参数。如果我们需要实现对所有后代元素的取回，可以传递通配选择器 '*'。
- find只在后代中遍历，不包括自己。
- 选择器 context 是由 .find() 方法实现的；因此，$('.item-ii').find('li') 等价于 $('li', '.item-ii')(找到类名为item-ii的标签下的li标签)。

### parent()方法
快速在集合中找到每一个元素的父元素。因为是父元素，这个方法只会向上查找一级。

理解节点查找关系：

	<div class="div">
	    <ul class="son">
	        <li class="grandson">1</li>
	    </ul>
	</div>
查找ul的父元素div, $(ul).parent()，就是这样简单的表达

- parent()无参数

parent()方法允许我们能够在DOM树中搜索到这些元素的父级元素，从有序的向上匹配元素，并根据匹配的元素创建一个新的 jQuery 对象

**注意：**jQuery是一个合集对象，所以通过parent是匹配合集中每一个元素的父元素

parent()方法选择性地接受同一型选择器表达式

同样的也是因为jQuery是合集对象，可能需要对这个合集对象进行一定的筛选，找出目标元素，所以允许传一个选择器的表达式

### parents()方法
快速查找每一个元素的所有祖辈元素。parent 只会查找一级，而 parents 则会往上一直查到祖先节点。

理解节点查找关系：

	<div class="div">
	    <ul class="son">
	        <li class="grandson">1</li>
	    </ul>
	</div>
在li节点上找到祖 辈元素div， 这里可以用$("li").parents()方法

- parents()无参数

parents()方法允许我们能够在DOM树中搜索到这些元素的祖先元素，从有序的向上匹配元素，并根据匹配的元素创建一个新的 jQuery 对象;

返回的元素秩序是从离他们最近的父级元素开始的

注意：jQuery是一个合集对象，所以通过parent是匹配合集中所有元素的祖辈元素

parents()方法选择性地接受同一型选择器表达式

同样的也是因为jQuery是合集对象，可能需要对这个合集对象进行一定的筛选，找出目标元素，所以允许传一个选择器的表达式

**注意事项：**

1 . parents()和.parent()方法是相似的，但后者只是进行了一个单级的DOM树查找

2   $( "html" ).parent()方法返回一个包含document的集合，而$( "html" ).parents()返回一个空集合。

### closest()方法
已选定的元素为中心，往内查找可以通过 find、children方法。（使用频率高）closest() 方法接受一个匹配元素的选择器字符串

从元素本身开始，在DOM 树上逐级向上级元素匹配，并返回最先匹配的祖先元素。

例如：在div元素中，往上查找所有的li元素，可以这样表达

    $("div").closet("li')
注意：jQuery是一个合集对象，所以通过closest是匹配合集中每一个元素的祖先元素

closest()方法给定的jQuery集合或元素来过滤元素

同样的也是因为jQuery是合集对象，可能需要对这个合集对象进行一定的筛选，找出目标元素，所以允许传一个jQuery的对象

注意事项：在使用的时候需要特别注意下

粗看.parents()和.closest()是有点相似的，都是往上遍历祖辈元素，但是两者还是有区别的，否则就没有存在的意义了

- 起始位置不同：.closest开始于当前元素 .parents开始于父元素
- 遍历的目标不同：.closest要找到指定的目标，.parents遍历到文档根元素，closest向上查找，直到找到一个匹配的就停止查找，parents一直查找到根元素，并将匹配的元素加入集合
- 结果不同：.closest返回的是包含零个或一个元素的jquery对象，parents返回的是包含零个或一个或多个元素的jquery对象

### next()方法
快速查找指定元素集合中每一个元素紧邻的后面同辈的元素集合。next()方法选择性地接受同一类型选择器表达式。

同样的也是因为jQuery是合集对象，可能需要对这个合集对象进行一定的筛选，找出目标元素，所以允许传一个选择器的表达式

理解节点查找关系：

如下class="item-1"元素就是红色部分，那蓝色的class="item-2"就是它的兄弟元素

	<ul class="level-3">
	    <li class="item-1">1</li>
	    <li class="item-2">2</li>
	    <li class="item-3">3</li>
	</ul>
- next()无参数

允许我们找遍元素集合中紧跟着这些元素的直接兄弟元素，并根据匹配的元素创建一个新的 jQuery 对象。

注意：jQuery是一个合集对象，所以通过next匹配合集中每一个元素的下一个兄弟元素

### prev()方法
快速查找指定元素集合中每一个元素紧邻的前面同辈元素的元素集合。

理解节点查找关系：

如下蓝色的class="item-2"的li元素，红色的节点就是它的prev兄弟节点

	<ul class="level-3">
	    <li class="item-1">1</li>
	    <li class="item-2">2</li>
	    <li class="item-3">3</li>
	</ul>
- prev()无参数

取得一个包含匹配的元素集合中每一个元素紧邻的前一个同辈元素的元素集合

    注意：jQuery是一个合集对象，所以通过prev是匹配合集中每一个元素的上一个兄弟元素
prev()方法选择性地接受同一类型选择器表达式

    同样的也是因为jQuery是合集对象，可能需要对这个合集对象    进行一定的筛选，找出目标元素，所以允许传一个选择器的表达式

### siblings()方法
快速查找指定元素集合中每一个元素的同辈元素。

理解节点查找关系：

如下蓝色的class="item-2"的li元素，红色的节点就是它的siblings兄弟节点

	<ul class="level-3">
	    <li class="item-1">1</li>
	    <li class="item-2">2</li>
	    <li class="item-3">3</li>
	</ul>
- siblings()无参数

取得一个包含匹配的元素集合中每一个元素的同辈元素的元素集合

    注意：jQuery是一个合集对象，所以通过siblings是匹配合集中每一个元素的同辈元素
siblings()方法选择性地接受同一类型选择器表达式

    同样的也是因为jQuery是合集对象，可能需要对这个合集对象进行一定的筛选，找出目标元素，所以允许传一个选择器的表达式

### add()方法
往集合后添加一个新元素。.add()的参数可以几乎接受任何的$()，包括一个 jQuery 选择器表达式，DOM 元素或 HTML 片段引用。

简单的看一个案例：

操作：选择所有的li元素，之后把p元素也加入到li的合集中

	<ul>
	    <li>list item 1</li>
	    <li>list item 3</li>
	</ul>
	<p>新的p元素</p>
处理一：传递选择器

    $('li').add('p')
处理二：传递dom元素

    $('li').add(document.getElementsByTagName('p')[0])
还有一种方式，就是动态创建P标签加入到合集，然后插入到指定的位置，但是这样就改变元素的本身的排列了

     $('li').add('<p>新的p元素</p>').appendTo(目标位置)

### each()方法
.each() 方法就是一个 for 循环的迭代器，它会迭代 jQuery 对象合集中的每一个 DOM 元素，每次回调函数执行时，会传递当前循环次数作为参数（从0开始计数）

所以大体上了解3个重点：

each是一个for循环的包装迭代器
each通过回调的方式处理，并且会有2个固定的实参，索引与元素
each回调方法中的this指向当前迭代的dom元素

看一个简单的案例

	<ul>
	    <li>慕课网</li>
	    <li>Aaron</li>
	</ul>
开始迭代li，循环2次

	$("li").each(function(index, element) {
	     index 索引 0,1
	     element是对应的li节点 li,li
	     this 指向的是li
	})
这样可以在循环体会做一些逻辑操作了，如果需要提前退出，可以以通过返回 false以便在回调函数内中止循