# jQuery

jQuery 是什么呢？有什么用？怎么用？ 我们一个一个问题来解答

jQuery 是一个快速、简洁的 JavaScript 框架。设计宗旨是 "write less,do more",即提倡写更少的代码，做更多的事情。它封装了 JavaScript 常用的功能代码，提供一种简便的 JavaScript 设计模式，优化 HTML 文档操作、事件处理、动画设计和 Ajax 交互。

jQuery 的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展；拥有便捷的插件扩展机制和丰富的插件。

http://jquery.com/
## 样式篇

#### $(document).ready
$(document).ready 的作用是等页面的文档（document）中的节点都加载完毕后，再去执行后续的代码，因为我们在执行代码的时候，可能会依赖页面的某一个元素，我们确保这个元素真正的被加载完毕后才能正确的使用。

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8"/>
        <title>第一个简单的jQuery程序</title>
        <style type="text/css">
            div{
                padding:8px 0px;
                font-size:12px;
                text-align:center;
                border:solid 1px #888;
            }
        </style>
        <script src="https://www.imooc.com/static/lib/jquery/1.9.1/jquery.js"></script>
        <script type="text/javascript">
                $(document).ready(function() {
                   $("div").html("您好，世界！");
                });
        </script>
    </head>
    <body>
        <div></div>
    </body>
    </html>
#### jQuery对象和DOM对象
jQuery 对象和 DOM 对象是不一样的！！！

- 通过 jQuery 方法包装后的对象，是一个类数组对象。
- 通过 jQuery 处理 DOM 操作，可以让开发者更专注业务逻辑的开发，而不需要我们具体知道哪个 DOM 节点有哪些方法，也不需要关心不同浏览器的兼容性问题，我们通过 jQuery 提供的 API 进行开发，代码会更加精短。

#### jQuery对象和DOM对象之间的转换

jQuery 是一个类数组对象，而 DOM 对象就是一个单独的 DOM 元素。

-  jQuery ->  DOM

1.  利用数组下标的方式读取到 jQuery 中的 DOM 对象

        var $div = $('div') //jQuery对象
        var div = $div[0] //转化成DOM对象
        div.style.color = 'red' //操作dom对象的属性
       

2.   通过 jQuery 自带的 get() 方法

    var $div = $('div') //jQuery对象
    var div = $div.get(0) //通过get方法，转化成DOM对象
    div.style.color = 'red' //操作dom对象的属性

- DOM ->  jQuery

$(参数) 是一个多功能的方法，通过传递不同的参数而产生不同的作用。如果传递给 $(DOM) 函数的参数是一个 DOM 对象， jQuery 方法会把这个 DOM 对象包装成一个新的 jQuery 对象。

    var div = document.getElementsByTagName('div'); //dom对象
    var $div = $(div); //jQuery对象
    var $first = $div.first(); //找到第一个div元素
    $first.css('color', 'red'); //给第一个元素设置颜色

### jQuery选择器
#### id 选择器
一个用来查找的ID，即元素的 id 属性。

      $("#id")

id 是惟一的，每个 id 值在一个页面中只能使用一次。如果多个元素分配了相同的 id，则会匹配 id 选择集合中的第一个 DOM 元素。

#### 类选择器
通过 class 样式类名来获取节点。

      $(".class")

类选择器相对于 id 选择器来说，效率会低一点。但是可以支持多选。

#### 元素选择器
根据给定 (html) 标记名称选择所有的元素。搜素指定元素标签名的所有节点，这是一个合集操作。

      $(".element")

第一组：通过getElementsByTagName方法得到页面所有的<div>元素

    var divs = document.getElementsByTagName('div');
divs 是 dom 合集对象，通过循环给每一个合集中的 <div> 元素赋予新的border样式

第二组：同样的效果，$("p") 选取所有的 <p> 元素，通过 css 方法直接赋予样式

#### 全选择器

      $("*")

#### 层级选择器

子元素 / 后代元素 / 兄弟元素 / 相邻元素；层级选择器就是来处理这些关系的用的。

[层级选择器图片]

1. 层级选择器中都有一个参考点
2. 后代选择器包含子选择器的选择的内容
3. 一般兄弟选择器包含相邻兄弟的选择器
4. 相邻兄弟选择器和一般兄弟选择器所选择到的元素，必须在同一个父元素下

#### 基本筛选选择器

[基本筛选选择器]

1. :eq(), :lt(), :gt(), :even, :odd 用来筛选他们前面的匹配表达式的集合元素，根据之前匹配的元素在进一步筛选，注意jQuery合集都是从0开始索引

2. gt是一个段落筛选，从指定索引的下一个开始，gt(1) 实际从2开始

#### 内容筛选选择器
【内容筛选选择器】

1. contains与:has都有查找的意思，但是contains查找包含“指定文本”的元素，has查找包含“指定元素”的元素
2. 如果:contains匹配的文本包含在元素的子元素中，同样认为是符合条件的。
3. parent与:empty是相反的，两者所涉及的子元素，包括文本节点

#### 可见性筛选选择器

[可见性筛选选择器]

通过这几种方式隐藏一个元素：
-  CSS display的值是none。
-  type="hidden"的表单元素。
-  宽度和高度都显式设置为0。
-  一个祖先元素是隐藏的，该元素是不会在页面上显示
-  CSS visibility的值是hidden
-  CSS opacity的指是0

#### 属性筛选选择器

[属性筛选选择器]
浏览器支持：
[att=val]、[att]、[att|=val]、[att~=val]  属于CSS 2.1规范
[ns|attr]、[att^=val]、[att*=val]、[att$=val] 属于CSS3规范
[name!="value"]  属于jQuery 扩展的选择器

    [attr="value"]能帮我们定位不同类型的元素，特别是表单form元素的操作，比如说input[type="text"],input[type="checkbox"]等
    [attr*="value"]能在网站中帮助我们匹配不同类型的文件

#### 子元素筛选选择器

[子元素筛选选择器]

1. first只匹配一个单独的元素，但是:first-child选择器可以匹配多个：即为每个父级元素匹配第一个子元素。这相当于:nth-child(1)
2. last 只匹配一个单独的元素， :last-child 选择器可以匹配多个元素：即，为每个父级元素匹配最后一个子元素
3. 如果子元素只有一个的话，:first-child与:last-child是同一个
4. only-child匹配某个元素是父元素中唯一的子元素，就是说当前子元素是父元素中唯一的元素，则匹配
5. jQuery实现:nth-child(n)是严格来自CSS规范，所以n值是“索引”，也就是说，从1开始计数，:nth-child(index)从1开始的，而eq(index)是从0开始的
6. nth-child(n) 与 :nth-last-child(n) 的区别前者是从前往后计算，后者从后往前计算

#### 表单元素选择器

[表单元素选择器]

#### 表单对象属性筛选选择器

[表单对象属性筛选选择器]

1. 选择器适用于复选框和单选框，对于下拉框元素, 使用 :selected 选择器
2. 在某些浏览器中，选择器:checked可能会错误选取到<option>元素，所以保险起见换用选择器input:checked，确保只会选取<input>元素

#### 特殊选择器this

    $('p').click(function(){
        //把p元素转化成jQuery的对象
        var $this= $(this) 
        $this.css('color','red')
    })

this ，表示当前的上下文对象是一个html 对象，可以调用html对象所拥有的属性和方法。

$(this) ，代表的上下文对象是一个 jQuery 的上下文对象，可以调用 jQuery 的方法和属性值。

#### .atrr()与.removeAttr()

attr() 有4个表达式

- attr(传入属性名)：获取属性的值
- attr(属性名，属性值)：设置属性的值
- attr(属性名，函数值)：设置属性的函数值
- attr(attributes)：给指定元素设置多个属性值，即：{属性名一："属性值一"}

removeAttr() 删除方法

.removeAttr(attributeName): 为匹配的元素集合中的每个元素中移除一个属性（attribute)

优点：

attr、removeAttr都是jQuery为了属性操作封装的，直接在一个 jQuery 对象上调用该方法，很容易对属性进行操作，也不需要去特意的理解浏览器的属性名不同的问题

注意的问题：

dom中有个概念的区分：Attribute和Property翻译出来都是“属性”，《js高级程序设计》书中翻译为“特性”和“属性”。简单理解，Attribute就是dom节点自带的属性

例如：html中常用的id、class、title、align等：

    <div id="immooc" title="慕课网"></div>
而Property是这个DOM元素作为对象，其附加的内容，例如,tagName, nodeName, nodeType,, defaultChecked, 和 defaultSelected 使用.prop()方法进行取值或赋值等

    获取Attribute就需要用attr，获取Property就需要用prop

#### html()及.text()

**.html() 方法：**获取集合中第一个匹配元素的 HTML 内容或设置每一个匹配元素的 html 内容。

.html()方法内部使用的是DOM的innerHTML属性来处理的，所以在设置与获取上需要注意的一个最重要的问题，这个操作是针对整个HTML内容（不仅仅只是文本内容）

-.html() 不传入值，就是获取集合中第一个匹配元素的HTML内容
-.html( htmlString )  设置每一个匹配元素的html内容
-.html( function(index, oldhtml) ) 用来返回设置HTML内容的一个函数

.text() 方法：得到匹配元素集合中每一个元素的文本内容结合，包括他们的后代或者设置匹配元素结合中每个元素的文本内容为指定的文本内容。

.text()结果返回一个字符串，包含所有匹配元素的合并文本

text() 得到匹配元素集合中每个元素的合并文本，包括他们的后代
.text( textString ) 用于设置匹配元素内容的文本
.text( function(index, text) ) 用来返回设置文本内容的一个函数

.html与.text的异同:

.html与.text的方法操作是一样，只是在具体针对处理对象不同
.html处理的是元素内容，.text处理的是文本内容
.html只能使用在HTML文档中，.text 在XML 和 HTML 文档中都能使用
如果处理的对象只有一个子文本节点，那么html处理的结果与text是一样的
火狐不支持innerText属性，用了类似的textContent属性，.text()方法综合了2个属性的支持，所以可以兼容所有浏览器

#### .val()
主要处理表单元素的值。如input、select和textrea

.val()无参数，获取匹配的元素集合中第一个元素的当前值
.val( value )，设置匹配的元素集合中每个元素的值
.val( function ) ，一个用来返回设置值的函数

 注意事项：

通过.val()处理select元素， 当没有选择项被选中，它返回null
.val()方法多用来设置表单的字段的值
如果select元素有multiple（多选）属性，并且至少一个选择项被选中， .val()方法返回一个数组，这个数组包含每个选中选择项的值

.html(),.text()和.val()的差异总结：  

.html(),.text(),.val()三种方法都是用来读取选定元素的内容；只不过.html()是用来读取元素的html内容（包括html标签），.text()用来读取元素的纯文本内容，包括其后代元素，.val()是用来读取表单元素的"value"值。其中.html()和.text()方法不能使用在表单元素上,而.val()只能使用在表单元素上；另外.html()方法使用在多个元素上时，只读取第一个元素；.val()方法和.html()相同，如果其应用在多个元素上时，只能读取第一个表单元素的"value"值，但是.text()和他们不一样，如果.text()应用在多个元素上时，将会读取所有选中元素的文本内容。
.html(htmlString),.text(textString)和.val(value)三种方法都是用来替换选中元素的内容，如果三个方法同时运用在多个元素上时，那么将会替换所有选中元素的内容。
.html(),.text(),.val()都可以使用回调函数的返回值来动态的改变多个元素的内容。

#### 增加样式.addClass()
用于动态增加 class 类名

.addClass(className)方法：

.addClass( className ) : 为每个匹配元素所要增加的一个或多个样式名
.addClass( function(index, currentClass) ) : 这个函数返回一个或更多用空格隔开的要增加的样式名
注意事项：

.addClass()方法不会替换一个样式类名。它只是简单的添加一个样式类名到元素上
简单的描述下：在p元素增加一个newClass的样式

    <p class="orgClass">
    $("p").addClass("newClass")
那么p元素的class实际上是 class="orgClass newClass"样式只会在原本的类上继续增加，通过空格分隔

#### 删除样式.removeClass()

.removeClass()方法

.removeClass( [className ] )：每个匹配元素移除的一个或多个用空格隔开的样式名
.removeClass( function(index, class) ) ： 一个函数，返回一个或多个将要被移除的样式名
注意事项

如果一个样式类名作为一个参数,只有这样式类会被从匹配的元素集合中删除 。 如果没有样式名作为参数，那么所有的样式类将被移除


#### 切换样式.toggleClass()
toggleClass( )方法：在匹配的元素集合中的每个元素上添加或删除一个或多个样式类,取决于这个样式类是否存在或值切换属性。即：如果存在（不存在）就删除（添加）一个类

.toggleClass( className )：在匹配的元素集合中的每个元素上用来切换的一个或多个（用空格隔开）样式类名
.toggleClass( className, switch )：一个布尔值，用于判断样式是否应该被添加或移除
.toggleClass( [switch ] )：一个用来判断样式类添加还是移除的 布尔值
.toggleClass( function(index, class, switch) [, switch ] )：用来返回在匹配的元素集合中的每个元素上用来切换的样式类名的一个函数。接收元素的索引位置和元素旧的样式类作为参数
注意事项：

toggleClass是一个互斥的逻辑，也就是通过判断对应的元素上是否存在指定的Class名，如果有就删除，如果没有就增加
toggleClass会保留原有的Class名后新增，通过空格隔开

#### 样式操作.css()

.css() 方法：获取元素样式属性的计算值或者设置元素的CSS属性

获取：

.css( propertyName ) ：获取匹配元素集合中的第一个元素的样式属性的计算值
.css( propertyNames )：传递一组数组，返回一个对象结果
设置：

 .css(propertyName, value )：设置CSS
.css( propertyName, function )：可以传入一个回调函数，返回取到对应的值进行处理
.css( properties )：可以传一个对象，同时设置多个样式
注意事项：

浏览器属性获取方式不同，在获取某些值的时候都jQuery采用统一的处理，比如颜色采用RBG，尺寸采用px
.css()方法支持驼峰写法与大小写混搭的写法，内部做了容错的处理
当一个数只被作为值（value）的时候， jQuery会将其转换为一个字符串，并添在字符串的结尾处添加px，例如 .css("width",50}) 与 .css("width","50px"})一样

.css()与.addCLass()设置样式的区别：

可维护性：

.addClass()的本质是通过定义个class类的样式规则，给元素添加一个或多个类。css方法是通过JavaScript大量代码进行改变元素的样式

通过.addClass()我们可以批量的给相同的元素设置统一规则，变动起来比较方便，可以统一修改删除。如果通过.css()方法就需要指定每一个元素是一一的修改，日后维护也要一一的修改，比较麻烦

灵活性：

通过.css()方式可以很容易动态的去改变一个样式的属性，不需要在去繁琐的定义个class类的规则。一般来说在不确定开始布局规则，通过动态生成的HTML代码结构中，都是通过.css()方法处理的

样式值：

.addClass()本质只是针对class的类的增加删除，不能获取到指定样式的属性的值，.css()可以获取到指定的样式值。

样式的优先级：

css的样式是有优先级的，当外部样式、内部样式和内联样式同一样式规则同时应用于同一个元素的时候，优先级如下

外部样式 < 内部样式 < 内联样式
.addClass()方法是通过增加class名的方式，那么这个样式是在外部文件或者内部样式中先定义好的，等到需要的时候在附加到元素上
通过.css()方法处理的是内联样式，直接通过元素的style属性附加到元素上的
通过.css方法设置的样式属性优先级要高于.addClass方法
总结：

.addClass与.css方法各有利弊，一般是静态的结构，都确定了布局的规则，可以用addClass的方法，增加统一的类规则
如果是动态的HTML结构，在不确定规则，或者经常变化的情况下，一般多考虑.css()方式

#### 元素的数据存储

jQuery提供的存储接口

jQuery.data( element, key, value )   //静态接口,存数据
jQuery.data( element, key )  //静态接口,取数据   
.data( key, value ) //实例接口,存数据
.data( key ) //实例接口,存数据
2个方法在使用上存取都是通一个接口，传递元素，键值数据。在jQuery的官方文档中，建议用.data()方法来代替。

我们把DOM可以看作一个对象，那么我们往对象上是可以存在基本类型，引用类型的数据的，但是这里会引发一个问题，可能会存在循环引用的内存泄漏风险

通过jQuery提供的数据接口，就很好的处理了这个问题了，我们不需要关心它底层是如何实现，只需要按照对应的data方法使用就行了

同样的也提供2个对应的删除接口，使用上与data方法其实是一致的，只不过是一个是增加一个是删除罢了

jQuery.removeData( element [, name ] )
.removeData( [name ] )

---
## 1.如何设置select只读不可编辑且select的值可传递
disabled属性

`<select style="width:195px" name="role" id="role" disabled="disabled">`

当属性设置为"disabled"时，提交表单时，select的值无法传递，提交前移除disabled属性$("#role").removeAttr("disabled");

jquery添加属性$("#role").attr("disabled","disabled");

