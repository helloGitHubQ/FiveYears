# JSON
是什么？有什么用？怎么用？

- 是 JavaScript 对象表示法。
- 是存储和交换文本信息的语法。类似于XML
- 独立于语言。
- 具有自我描述性，更易理解。


### JSON 转 JavaScript 对象
因为 JSON 文本格式在语法上与创建 JavaScript 对象的代码相同。所以 JavaScript 程序能够使用内建的 eval() 函数。

### JSON实例
- 实例：

      <html>
      <body>
      <h2>在 JavaScript 中创建 JSON 对象</h2>

      <p>
      Name: <span id="jname"></span><br />
      Age: <span id="jage"></span><br />
      Address: <span id="jstreet"></span><br />
      Phone: <span id="jphone"></span><br />
      </p>

      <script type="text/javascript">
      var JSONObject= {
      "name":"Bill Gates",
      "street":"Fifth Avenue New York 666",
      "age":56,
      "phone":"555 1234567"};
      document.getElementById("jname").innerHTML=JSONObject.name
      document.getElementById("jage").innerHTML=JSONObject.age
      document.getElementById("jstreet").innerHTML=JSONObject.street
      document.getElementById("jphone").innerHTML=JSONObject.phone
      </script>

      </body>
      </html>

为什么说 JSON 类似于 XML 呢？
- json 是纯文本。
- json 具有自我描述性（人类可读）
- json 具有层级结构（嵌套）
- json 可通过 JavaScript 进行解析
- json 数据可使用 Ajax 进行传输。

不同点是：
- 没有结束标签。
- 更短。
- 读写的书读更快。
- 能够使用内建的 JavaScript eval() 方法进行解析。
- 使用数组。
- 不适用保留字。

为什么使用 JSON ?

对于 AJAX 应用程序来说，JSON 比 XML 更快更易使用。

使用 XML:
- 读取 XML 文档
- 使用 XML DOM 来循环遍历文档
- 读取值并存储在变量中

使用 JSON：
- 读取 JSON 字符串
- 用 eval() 处理 JSON 字符串

### JSON 语法
数据在名称 - 值 对中 / 数据由逗号分隔 / 花括号保存对象 / 方括号保存数组

- JSON名称 - 值
"firstName" : "John"
    
- JSON值
数字（整数或浮点数） / 字符串（在双引号中） / 逻辑值（true 或 false） / 数组（在方括号中） / 对象（在花括号中） / null

- JSON对象
{ "firstName":"John" , "lastName":"Doe" }

- JSON数组

      {
      "employees": [
      { "firstName":"John" , "lastName":"Doe" },
      { "firstName":"Anna" , "lastName":"Smith" },
      { "firstName":"Peter" , "lastName":"Jones" }
      ]
      }

### JSON使用
- JSON 文本转换为 JavaScipt 对象

      var txt = '{ "employees" : [' +
      '{ "firstName":"Bill" , "lastName":"Gates" },' +
      '{ "firstName":"George" , "lastName":"Bush" },' +
      '{ "firstName":"Thomas" , "lastName":"Carter" } ]}';
      var obj = eval ("(" + txt + ")");
 
- JSON解析器

提示：eval() 函数可编译并执行任何 JavaScript 代码。这隐藏了一个潜在的安全问题。

使用 JSON 解析器将 JSON 转换为 JavaScript 对象是更安全的做法。JSON 解析器只能识别 JSON 文本，而不会编译脚本。

在浏览器中，这提供了原生的 JSON 支持，而且 JSON 解析器的速度更快。
