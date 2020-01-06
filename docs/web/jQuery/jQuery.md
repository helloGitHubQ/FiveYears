# jQuery

> jQuery 是什么呢？有什么用？怎么用？ 我们一个一个问题来解答

jQuery 是一个快速、简洁的 JavaScript 框架。设计宗旨是 "write less,do more",即提倡写更少的代码，做更多的事情。它封装了 JavaScript 常用的功能代码，提供一种简便的 JavaScript 设计模式，优化 HTML 文档操作、事件处理、动画设计和 Ajax 交互。

jQuery 的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展；拥有便捷的插件扩展机制和丰富的插件。

[jQuery官网](http://jquery.com/)

- [jQuery 样式](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/web/jQuery/jQuery-CSS.md)

- [jQuery 事件](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/web/jQuery/jQuery-Event.md)

- [jQuery 动画](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/web/jQuery/jQuery-Animation.md)

- [jQuery DOM](https://github.com/helloGitHubQ/FiveYears/blob/master/docs/web/jQuery/jQuery-DOM.md)

---
## 1.如何设置select只读不可编辑且select的值可传递
disabled属性

`<select style="width:195px" name="role" id="role" disabled="disabled">`

当属性设置为"disabled"时，提交表单时，select的值无法传递，提交前移除disabled属性$("#role").removeAttr("disabled");

jquery添加属性$("#role").attr("disabled","disabled");

