---
layout: post
title: ".bind()之美 [来自 realazy]"
date: 2007-12-12 12:41:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/12/bind%e4%b9%8b%e7%be%8e-%e6%9d%a5%e8%87%aa-realazy.html"
---
##  

我并不是 [<font color="#007b99">Prototype JavaScript framework</font>](http://prototypejs.org/)的忠实粉丝，但我对它的总体代码质量印象深刻。具体而言，它为`Function`对象增加一个简洁的补充，对我管理函数呼叫执行后的上下文产生了极大的正面影响：`bind`跟`call`一样执行相同的常见任务，改变函数执行的上下文。不同之处在于`bind`返回的是函数引用可以备用，而不是`call`的立即执行而产生的最终结果。

如果需要简化一下`bind`函数以抓住概念的重点，我们可以先把它插进前面讨论的乘积例子中去，看它究竟是如何工作的。这是一个相当优雅的解决方案：

```
var first_object = {
  num: 42
 };
 var second_object = {
  num: 24
 };

 function multiply(mult) {
  return this.num * mult;
 }

 Function.prototype.bind = function(obj) {
  var method = this,
   temp = function() {
    return method.apply(obj, arguments);
   };

  return temp;
 }

 var first_multiply = multiply.bind(first_object);
 first_multiply(5); // 返回 42 * 5

 var second_multiply = multiply.bind(second_object);
 second_multiply(5); // 返回 24 * 5
```

首先，我们定义了`first_object`, `second_object`和`multiply`函数，一如既往。细心处理这些后，我们继续为`Function`对象的[`prototype`](http://en.wikipedia.org/wiki/Prototype-based_programming)定义一个`bind`方法，这样的话，我们程序里的函数都有一个`bind`方法可用。当执行`multiply.bind(first_object)`时，JavaScript为`bind`方法创建一个运行上下文，把`this`置为`multiply`函数的引用，并把第一个参数`obj`置为`first_object`的引用。目前为止，一切皆顺。

这个解决方案的真正天才之处在于`method`的创建，置为`this`的引用所指（即`multiply`函数自身）。当下一行的匿名函数被创建，`method`通过它的作用域链访问，obj亦然（不要在此使用`this`, 因为新创建的函数执行后，`this`会被新的、局部的上下文覆盖）。这个`this`的别名让`apply`执行`multiply`函数成为可能，而传递`obj`则确保上下文的正确。用计算机科学的话说，`temp`是一个闭包（[<cite><font color="#007b99">closure</font></cite>](http://www.jibbering.com/faq/faq_notes/closures.html)），它可以保证，需要在`first_object`的上下文中执行`multiply`，`bind`呼叫的最终返回可以用在任何的上下文中。

这才是前面说到的事件处理函数和`setTimeout`情形所真正需要的。以下代码完全解决了这些问题，绑定`deep_thought.ask_question`方法到`deep_thought`的上下文中，因此能在任何事件触发时都能正确运行：

```
function addhandler() {
 var deep_thought = new BigComputer(42),
  the_button = document.getElementById('thebutton');

 the_button.onclick = deep_thought.ask_question.bind(deep_thought);
}
```

漂亮。

]]\>

