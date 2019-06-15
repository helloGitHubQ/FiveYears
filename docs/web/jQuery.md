# jQuery
## 1.如何设置select只读不可编辑且select的值可传递
disabled属性

`<select style="width:195px" name="role" id="role" disabled="disabled">`

当属性设置为"disabled"时，提交表单时，select的值无法传递，提交前移除disabled属性$("#role").removeAttr("disabled");

jquery添加属性$("#role").attr("disabled","disabled");
