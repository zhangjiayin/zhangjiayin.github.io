---
layout: post
title: The Model-View-Controller Pattern —— MVC 模式[转]
date: 2007-05-17 19:17:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  dsq_thread_id: '4920867950'
author: 
permalink: "/2007/05/the-model-view-controller-pattern-%e2%80%94%e2%80%94-mvc-%e6%a8%a1%e5%bc%8f%e8%bd%ac.html"
---
###  

web 应用程序变化很大，而且，这种变化会引起大量的混乱，对于架构一个特定的应用程序，哪个或哪些模式是最好的。虽说如此，那么有没有一种“最好的”web 应用程序架构呢？

### 问题

你能不能部署一个单一 web 站点结构体系以适应每个常见的 web 应用程序，包括常见的表现元素、身份验证、表单验证，等等？

### 解决方案

Model-View-Controller(模型-视图-控制器，MVC) 模式将你的软件组织并分解成三个截然不同的角色：

- Model 封装了你的应用数据、应用流程和业务逻辑。

- View 从 Model 获取数据并格式化数据以进行显示。

- Controller 控制程序流程，接收输入，并把它们传递给 Model 和 View。

MVC 的起源

Model-View-Controller 模式是由 Trygve Reenskaug 于七十年代后期在施乐公司的 Palo Alto 研究中心(Xerox's Palo Alto Research Center，PARC)最初设计的。最初的参考实现是用 Smalltalk-80 写的，其最初的目的是设计来解决应用程序中的 GUI 交互问题。

只要你与 MVC 模式打过交道，你就会对它的实用性心存感激，尤其对于图形用户界面(Graphical User Interface，GUI)应用程序。此外，MVC 对 web 应用程序也很有用，虽然通过一连串无状态 web 连接访问一个服务器应用程序的不连续性会存在一些独特的挑战(也可以说是一种机会)。

如果你翻阅本章，寻找“一种真正的方法”来为 web 应用程序实现 MVC，我希望你不会对这里的答案太失望。根本就不存在什么完美的解决方案，但是有很多“最优实践”以及相关模式，它们的确可以帮助你有效地实现 MVC。希望这里介绍的观点可以为你的代码视为一个跳板，并引导你进行更多的研究。

#### The Model-View-Controller(模型-视图-控制器)

与其它设计模式不同，MVC 模式并没有直接反映一个你能够编写或配置的类结构。相反，MVC 更像一个概念上的指导原则或范型。

概念上的 MVC 模式被描述为三个对象 —— Model、View 和 Controller —— 之间的关系。由于 View 和 Controller 都可以从 Model 请求数据，所以 Controller 和 View 都依赖 Model。任何输入都通过 Controller 进入你的系统，然后 Controller 选择一个 View 来发出结果。对你，一个 PHP 开发人员，更具体的来说，Controller 处理每个进入的 HTTP 请求，而 View 则生成 HTTP 响应。

下面是一个概念上的 MVC 模式的图形描述：

<center><img height="286" width="237" src="http://www.wujianrong.com/photo/ch17sec02No.01.gif"></center>

在这个理想的 MVC 环境中，通信是单向的，如这个序列图所示：

![](http://www.wujianrong.com/photo/ch17sec02No.10.gif)

当然，具体到细节上就有些麻烦了。当在一个 web 应用程序中实现 MVC 时，Modle、View 和 Controller 从来不会在单一的类中出现，而是被实现为紧密相关的对象群体，在那里，每一组执行一个特定的 MVC 任务。Controller 可能由几个类组成，它们被组合到一起，用于分析 HTTP 响应并确定应用程序所需的动作。Model 几乎可以确定由多个类组成。而 View 在 web 应用程序中通常是某种模板系统，而且也很可能由几个对象组成。

在接下来的几节，我们稍微深入“MVC 三元组”的每个部分，了解每个部分都包含哪些模式，或哪些设计模式可以帮助实现每个部分，以及这些模式是如何帮助你组织你的代码的。

##### 模型

Model 包含了你的应用逻辑和数据，在你的应用程序中，它很可能是主要的值驱动器。Model 没有任何与表现层相关的特性，而且也和 HTTP 请求处理职责中完全无关。(作为一个经验方法，PHP Model 中决不要出现 HTML 标签或 <tt><font face="新宋体">$_GET</font></tt> 超全局变量)

###### 领域模型

Domain Model 是一个对象层，是对现实世界逻辑、数据和你应用程序所处理的问题的抽象。Domain Model 可分为两大类：Simple Domain Model 和 Rich Domain Model。

Simple Domain Model 往往是业务对象和数据库表之间一对一的通信。你已经见过的几种模式 —— Active Record、Table Data Gateway，以及 Data Mapper，所有这些与数据库相关的设计模式 —— 可以帮助你把与数据库相关的逻辑组织成一个 Domain Model(为了使本书例子合理、简单、易懂，所选素材都没有超出简单 Domain Model 的一对一的通信 —— 同构映射）。

Rich Domain Model 包含复杂的，使用继承机制紧密联系在一起的对象网络，在本书和 GoF 一书中介绍的众多模式起着杠杆作用。Rich Domain Models 往往是柔性的，精心测试过的，不断重构的，而且与它们所表达的领域所需的业务逻辑紧密耦合。

采用哪种 Domain Model 类型取决于你的应用环境。如果你正在建立的是一个非常简单的表单处理 web 应用，没必要建立 Rich Domain Model。然而，如果你正在编写一个价值数百万的企业内联网架构的核心库，那么努力开发一个 Rich Domain Model 就是值得的，它可以为你提供一个准确表达业务过程的平台，并可以让你快速传输数据。

Martin Fowler 在 PoEAA 中同时简要介绍了两种 Domain Model。而 Eric Evans 的 Domain Driven Design 一书，则完全专注于 Rich Domain Model 的实践应用和开发过程。

##### 视图

View 用于处理所有表现层方面的问题。View 从 Model 获取数据，并可以把它格式化成用于 web 页的 HTML，用于 web 服务的 XML，或用于 email 的文本。

鉴别你是否已经把你的代码成功地分离成了明确定义的角色的一个好方法就是，试着去取代(至少从概念上)另一个产生完全不同输出的 View。举例来说，如果你有一个 web 应用程序，要让程序使用 PHP CLI 在命令行方式下运行，你将必须做何更改？

尽管 View 有权访问 Model，但是让 View 调用 Model 的方法来改变它的状态是一种很不好的方式 —— 更新只应该由 Controller 来执行。View 调用的 Model 方法应该是没有副作用的只读数据检索方法。

有两种设计模式经常在 Views 中使用：Template View 和 Transform View。

###### Template View

Template View 是在 web 应用程序的 View 中使用的主要模式。这个模式使用一个包含特殊标记的模板文件(通常是 HTML)，当 Template View 被执行的时候，这些标记会被 Model 中的数据所替换。

PHP 本身就是一个特殊的 Template View 的例子，叫做服务器页面。Savant 就是一个基于使用 PHP 作为模板本身的模板系统([http://www.phpsavant.com/](http://www.phpsavant.com/))。

下面是一个使用 <tt><font face="新宋体">Savant</font></tt> 的例子：

```
// PHP4
require_once 'Savant2.php';

$tpl =& new Savant2();  
$tpl-\>assign('title', 'Colors of the Rainbow');  
$tpl-\>assign('colors', array('red',
```

