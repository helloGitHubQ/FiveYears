# JS 对象 

什么是对象？ JavaScript 中所有事务都是对象，如字符串，数值，数组，函数等，每个对象都带有属性和方法。

对象的属性：反映该对象某些特定的性质，如：字符串的长度，图片的大小等等

对象的方法：能够在对象上执行的动作。例如，表单的提交等

### 学习无处不在，只要有文本编辑器，就能编写 JavaScript 程序 --- 慕课

问题：js中有几个对象？

- JavaScript Array 对象
   - concat()
   - join()
   - reverse() 颠倒数组元素的顺序
   - slice() 从已有的数组中返回特定元素
   - sort()
- JavaScript Boolean 对象
- JavaScript Date 对象
   - getFullYear()
   - getDay()
   返回的数字是 0-6， 0 代表星期日
   
       <script type="text/javascript">
       var mydate=new Date();
       var weekday=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
       document.write("今天是：" + mydate.getDay());
       </script>

- JavaScript Math 对象
   - ceil()
   - floor()
   - round()
   - random()
- JavaScript Number 对象 （**对象是从此开始学习的**）
- JavaScript String 对象
   - chatAt()
   - indexOf()
   - split()
   - substring()
   - substr()
- JavaScript RegExp 对象
- JavaScript 全局对象(Functions)
- JavaScript 事件（Events）  


[js对象学习教程](http://www.w3school.com.cn/jsref/jsref_obj_array.asp "js对象")

