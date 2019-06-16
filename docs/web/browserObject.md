# BOM
## 浏览器对象
window 对象是 BOM 的核心,window 对象指当前的浏览器窗口

### window 对象方法：
---

![window对象方法](https://i.imgur.com/IFmd2MW.jpg)


1. 警告 -- alert 消息对话框

	`alert(字符串或者常量)`
2. 确认 -- confirm 消息对话框

![confirm](https://i.imgur.com/1R2A7vU.png)
	
对话框是排他的，即用户在点击对话框之前不能进行任何其他操作。

3. 提问 -- prompt 消息对话框

![prompt](https://i.imgur.com/dMWVmWH.png)

4. 打开新窗口 window.open()

![open](https://i.imgur.com/wweNk5G.png)

![open](https://i.imgur.com/zutZfNX.png)

5. 关闭窗口 window.close()

![close](https://i.imgur.com/pWbMyvV.png)

[js学习教程](http://www.w3school.com.cn/b.asp "js")

### JavaScript 计时器
---
计时器类型：

一次性计时器：仅在指定的延迟时间之后触发一次

间隔性触发计数器：每隔一定时间间隔就触发一次

计时器方法：

  - setTimeout() ： 指定延迟时间之后来执行代码
  - clearTimeout() ： 取消 setTimeout() 设置
  - setInterval()  ： 每隔指定的时间执行代码
  - dearInterval() ： 取消 setInterval() 设置
  
#### 计时器 setInterval()
在执行时，从载入页面后每隔指定的时间执行代码。
 
语法:`setInterval(代码,交互时间);`

参数说明：

1. 代码：要调用的函数或要执行的代码串。

2. 交互时间：周期性执行或调用表达式之间的时间间隔，以毫秒计（1s=1000ms）。

返回值:一个可以传递给 clearInterval() 从而取消对"代码"的周期性执行的值。

#### 取消计时器 clearInterval()
clearInterval() 方法可取消由 setInterval() 设置的交互时间。

语法：`clearInterval(id_of_setInterval)`

参数说明: id_of_setInterval：由 setInterval() 返回的 ID 值。

#### 计时器 setTimeout() 
在载入后延迟指定时间后，去执行一次表达式仅执行一次

计时器语法：`setTimeout(代码,延迟时间);`

参数说明：

1. 要调用的函数或要执行的代码串。

2. 延时时间：在执行代码前需等待的时间，以毫秒为单位（1s=1000ms)。


#### 取消计时器 clearTimeout()
取消计时器语法:`clearTimeout(id_of_setTimeout)`

参数说明: id_of_setTimeout：由 setTimeout() 返回的 ID 值。该值标识要取消的延迟执行代码块。

### History 对象
---
记录用户曾经浏览过的页面( URL )，并可以实现浏览器前进与后退相似导航的功能。从窗口被打开的那一刻开始记录，每个浏览器窗口、每一个标签页乃至每一个框架，都有自己的 history对象与特定的 window 对象关联。

语法： `window.history.[属性|方法]`

注意：window可以省略。

History 对象属性: length 返回浏览器历史列表中的 URL 数量

History 对象方法： 

![History对象方法](https://i.imgur.com/MvJOAqq.jpg)


返回前一个浏览的页面：back() 方法，加载 history 列表中的前一个 URL .

语法： `window.history.back();`

返回下一个浏览的页面：forward()方法，加载 history 列表中的下一个 URL。

语法：`window.history.forward();`

返回浏览历史中的其他页面：go()方法，根据当前所处的页面，加载 history 列表中的某个具体的页面。

语法： `window.history.go(number);`

![返回浏览历史中的其他页面的参数](https://i.imgur.com/CKsEgY4.jpg)

### Localtion 对象
---
location用于获取或设置窗体的URL，并且可以用于解析URL。
 
语法: `location.[属性|方法]`

![Location对象](https://i.imgur.com/qLNgFap.png)

### navigator 对象
---
Navigator 对象包含有关浏览器的信息，通常用于检测浏览器与操作系统的版本。

![Navigator对象](https://i.imgur.com/keF3xXb.jpg)

- userAgent 对象

返回用户代理头的字符串表示(就是包括浏览器版本信息等的字符串)。

语法：`navigator.userAgent`

![userAgent](https://i.imgur.com/yns4gDs.jpg)

### screen 对象

screen对象用于获取用户的屏幕信息。

语法：`window.screen.属性`

![screen对象](https://i.imgur.com/BUYp5UC.png)

### 屏幕分辨率的高和宽以及可用的屏幕的高和宽

1.reen.height 返回屏幕分辨率的高

2. screen.width 返回屏幕分辨率的宽

3 screen.availWidth 属性返回访问者屏幕的宽度，以像素计，减去界面特性，比如任务栏。

4 screen.availHeight 属性返回访问者屏幕的高度，以像素计，减去界面特性，比如任务栏。
