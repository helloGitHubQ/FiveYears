# Ajax

是什么？有什么用？怎么用？


Ajax (Asynchronous JavaScript and XML)是异步的JavaScript和XML。局部刷新。

案例：登录时用户名判断是否被注册过。

## Ajax XHR
### 数据请求get

- 创建XMLHttpRequest对象

        var xmlhttp;
        if (window.XMLHttpRequest)
          {// code for IE7+, Firefox, Chrome, Opera, Safari
          xmlhttp=new XMLHttpRequest();
          }
        else
          {// code for IE6, IE5
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
          }
- 发送请求

      xmlhttp.open("GET","test1.txt",true);
      xmlhttp.send();
### 数据请求post
- 创建对象

          var xmlhttp;
          if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
            }
          else
            {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
- 发送请求

      xmlhttp.open("POST","demo_post.asp",true);
      xmlhttp.send();
      
如果需要像 HTML 表单那样 POST 数据，请使用 setRequestHeader() 来添加 HTTP 头。然后在 send() 方法中规定您希望发送的数据：

    xmlhttp.open("POST","ajax_test.asp",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.send("fname=Bill&lname=Gates");      
    
### get || post
get更简单更快，并且在大部分情况下都能使用。

post 无法使用缓存文件。向服务器发送大量数据请求。发送包含未知字符的用户输入。

### 响应
获取响应数据。注册监听

- responseText
获取字符串形式的响应数据。

    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    
- responseXML
获取XML形式的响应数据。

      xmlDoc=xmlhttp.responseXML;
      txt="";
      x=xmlDoc.getElementsByTagName("ARTIST");
      for (i=0;i<x.length;i++)
        {
        txt=txt + x[i].childNodes[0].nodeValue + "<br />";
        }
      document.getElementById("myDiv").innerHTML=txt;
    
### XHR readyState
- onreadystatechange 事件
当 readyState 等于 4 (请求已完成，且响应已就绪)且状态为 200 时，表示响应已就绪

        xmlhttp.onreadystatechange=function()
          {
          if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
            document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            }
          }
- 使用 Callback 函数

        function myFunction()
        {
        loadXMLDoc("ajax_info.txt",function()
          {
          if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
            document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            }
          });
        }

## 校验用户名


[Ajax教程](http://www.w3school.com.cn/ajax/index.asp)
