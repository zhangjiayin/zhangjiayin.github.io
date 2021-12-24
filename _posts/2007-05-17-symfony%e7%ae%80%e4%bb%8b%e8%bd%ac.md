---
layout: post
title: Symfony简介[转]
date: 2007-05-17 10:17:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/05/symfony%e7%ae%80%e4%bb%8b%e8%bd%ac.html"
---
 **Overview**

**概要**

Symfony is an object-oriented PHP5 framework based on the MVC model. Symfony allows for the separation of business rules, server logic and presentation views of a web application. It also contains numerous tools and classes aimed at shortening the development time of a complex web application.

Symfony是一个基于MVC模型的面向对象的PHP5框架（framework）。Symfony可以帮助你将web应用程序的业务逻辑、服务器端逻辑和页面显示分开。它也包含了许多的工具和类，这些工具和类可以帮助你缩短开发复杂web应用程序的时间。

**What is a framework?**

**什么是框架（framework）？**

A framework adds new mechanisms on top of a programming language, and these mechanisms automate many of the development patterns used for a given purpose. A framework also adds structure to the code, and pushes the developer to write better, more readable and maintainable code. A framework also makes programming easier, since it packages complex operations into simple statements.

框架在编程语言之上替我们添加一些机制，这些机制可以帮助我们自动应用各种开发模式以更好的实现某些给定的开发目标。框架也会很好的架构我们的代码，推动开发者写出更好的、更易读的并且可维护的代码。由于框架将一些复杂操作封装在了一些简单的语句里，所以它可以使我们的开发更加简单。

A framework is usually developed with the same language that it extends. A PHP5 framework is a set of files written in PHP5.

由于框架的目的一般都是对所基于的编程语言进行一定扩展，所以它一般采用原编程语言，并且扩展之。一个PHP5的框架就是一批用PHP5写成的文件。

A framework will add layering to an application. In general, they divide applications in three layers:

框架一般都会将应用程序分层。一般来讲，它一般会将应用程序分为如下三层：

- The **presentation logic** handles the interactions between the user and the software
- **表现层逻辑** 处理用户和应用程序之间的交互。
- The **data source logic** carries the access to a database or other data providers
- **数据源逻辑** 处理所有与数据库或者其他数据提供者的交互。
- The **domain logic** , or business logic, is the remaining piece. It involves calculation made on inputs, manipulation of data from the presentation, and dispatching of data source logic according to the commands received from the presentation.
- **领域逻辑** ，或者叫业务逻辑，这是留下来让你填写的地方。它包括计算用户输入，处理表现层的数据，根据表现层命令执行相应的数据源逻辑等。

Web application frameworks intend to facilitate the development of... web applications (websites, Intranets, etc.). Building a basic dynamic website can be easily achieved with existing programming languages, and PHP is known for its simplicity and broadly adopted for that purpose. With PHP alone, you can already query a database, manage session cookies, access files in the server, etc. But when it comes to building a more complex website, where business logic increases the volume of code to maintain, the need of a web application framework arises.

Web应用程序框架的目的就是想要简化各种Web应用程序的开发（包括网站，内网应用程序等）。用现存的编程语言当然可以比较轻松的建造基本的动态网站，比如PHP就是因其的简单性和广泛采用性而被大家所熟知。仅用PHP，你就可以查询数据库，管理session cookies，访问服务器上的文件，等等。但是，当你需要开发一个比较复杂的网站时，当由于业务代码的激增而导致有大量代码需要维护时，web应用程序框架的重要性就体现出来。

**What is symfony?**

**什么是symfony？**

Symfony is a complete framework designed to help and speedup the development of web applications.

Symfony完全是为了帮助和加速web应用程序的开发而设计的。

It is based on the following concepts:

它基于如下的概念：

- compatible with as many environments as possible
- 尽可能的兼容所有的应用环境
- easy to install and configure
- 简单安装和配置
- simple to learn
- 易于学习
- enterprise ready
- 支持企业开发
- convention rather than configuration, supporting fallback calls
- 依靠惯例而不是配置，<font color="#000000">支持回滚调用</font><!--[if !supportAnnotations]-->[<font color="#800080">[i1]</font>](http://blog.csdn.net/coofucoo/archive/2006/04/19/669749.aspx#_msocom_1)<!--[endif]--> 
- simple in most cases, but still flexible enough to adapt to complex cases
- 尽量使多数情况简单，但是当需要复杂时，依然能够支持
- most common web features included
- 包括大多数通用的web特性
- compliant with most of the web "best practices" and web "design patterns"
- 遵从大多数的web最佳实践和web设计模式
- very readable code with easy maintenance
- 非常易读的代码，非常高的可维护性
- open source
- 开源

The main concept underlying the symfony framework is that the most common tasks are done automatically so that the developer can focus entirely on the specifics of an application. There is no need to reinvent the wheel every time a new web application is built.

隐藏在symfony框架背后的最重要的思想就是越多的普通的工作由计算机来自动完成，开发者就可以更加完全的投入自己的精力于应用程序中那些更需要投入精力的特殊的地方。每次打造一个新的Web应用时，你都不需要重新发明轮子了。

To fulfill these requirements, symfony was written entirely in [PHP5](http://www.php.net/manual/en/migration5.php). It has been thoroughly tested in various real world projects, and is actually in use for high demand e-business websites. It is compatible with most of the available databases, among which:

为了完成这样的需求，symfony全部是用PHP5编写的。他已经被各式各样的真实地项目所完全测试，并且已经在一些高要求的电子商务网站中应用。它可以兼容几乎所有已知的数据库，比如：

- MySQL
- PostgreSQL
- Oracle
- MSSQL
- and any other database if a [Creole](http://creole.phpdb.org/trac/) driver exists for it
- 任何其他的数据库，只要它具备[Creole](http://creole.phpdb.org/trac/)驱动

The symfony object model relies on three distinct layers:

Symfony的对象模型依赖于如下三个独特的层次：

- a database abstraction
- 一个数据库抽象层
- an object-relational mapping 
- 一个对象-关系映射层
- a Model-View-Controller model for the front and back-office 
- 一个Model-View-Controller模型用来支持前端和后端的应用

Common features of web projects are made easy since Symfony natively automates them:

由于Symfony替你自动化了许多操作，所以一些通用的Web项目的特性将非常容易的被支持

- internationalization
- 国际化
- templating with helpers
- <font color="#000000">templating with helpers</font><!--[if !supportAnnotations]-->[<font color="#800080">[i2]</font>](http://blog.csdn.net/coofucoo/archive/2006/04/19/669749.aspx#_msocom_2)<!--[endif]--> 
- form validation
- 表单验证
- cache management
- 缓存管理
- shopping cart management
- 购物车管理
- smart URLs
- 智能URLs
- Scaffolding
- <font color="#000000">Scaffolding</font><!--[if !supportAnnotations]-->[<font color="#800080">[i3]</font>](http://blog.csdn.net/coofucoo/archive/2006/04/19/669749.aspx#_msocom_3)<!--[endif]--> 
- email sending
- 邮件发送
- Pagination 
- 分页支持
- <city><place><span style="font-size: 12pt">AJAX</span></place></city> interactions
- Ajax式交互

In addition, to fulfill the requirements of enterprises having their own coding guidelines and project management rules, symfony can be entirely reconfigured using [YAML](http://www.yaml.org/) configuration files. It provides by default, several development environments, and is bundled with tools to easily achieve the following operations:

另外，由于企业开发有其自身的代码规范和项目管理规则，为了满足该需求，symfony可以用[YAML](http://www.yaml.org/)配置文件来完全重新配置。一般的，它提供许多开发环境，并且绑定了一批工具来完成如下的操作：

- prototyping
- <font color="#000000">prototyping</font><!--[if !supportAnnotations]-->[<font color="#800080">[i4]</font>](http://blog.csdn.net/coofucoo/archive/2006/04/19/669749.aspx#_msocom_4)<!--[endif]--> 
- content management
- 内容管理
- live configuration changes
- 在线配置变更
- deployment
- 部署
- unit testing
- 单元测试
- applicative testing
- 可用性测试
- logging
- <font color="#000000">logging</font><!--[if !supportAnnotations]-->[<font color="#800080">[i5]</font>](http://blog.csdn.net/coofucoo/archive/2006/04/19/669749.aspx#_msocom_5)<!--[endif]--> 
- debugging
- 调试

Symfony uses some code fragments of other open source projects:

Symfony采用了一些其他的开源项目的代码片断；

- [Creole](http://creole.phpdb.org/trac/), for the database abstraction layer 
- [Creole](http://creole.phpdb.org/trac/)，为数据抽象层
- [Propel](http://propel.phpdb.org/trac/), for the object-relational mapping layer
- [Propel](http://propel.phpdb.org/trac/)，为对象-关系映射层
- [Mojavi](http://www.mojavi.org/), for the Model-View-Controller model layer
- [Mojavi](http://www.mojavi.org/)，为Model-View-Controller模型层

**Is symfony made for me?**

**Symfony**** 适合我吗？**

Whether you are a PHP5 expert or a beginner in web application programming doesn't matter. The main factor that should direct your decision is the size of your project.

无论你是一个PHP5的高手或者是一个Web应用程序开发的初学者，都不要紧。决定Symfony是否适合你的关键因素是你需要开发的项目的大小。

If you want to develop a simple website with five to ten pages, having limited access to a database and no obligation for performance, availability or documentation, then you should stick with PHP alone. You wouldn't take much advantage of the features of a web application framework, and using object orientation or a MVC model would only slow down your development. Symfony is not optimized to run efficiently on a shared server with only CGI support.

如果你只是希望开发一个简单的只有5页或者10页的网站，仅仅需要简单的访问一下数据库，也不需要关注性能、可用性和文档化，那么你用PHP就可以了。这种情况即使你使用web应用程序框架也不会给你带来多大的好处。相反，面向对象的特性和MVC模型还有可能减慢你的开发。<font color="#000000"><span>Symfony</span>并不是为那些运行在共享服务器上，仅支持<span>CGI</span>的简单、高效应用而设计的。</font><!--[if !supportAnnotations]-->[<font color="#800080">[i6]</font>](http://blog.csdn.net/coofucoo/archive/2006/04/19/669749.aspx#_msocom_6)<!--[endif]-->

On the other hand, if you develop bigger web applications, with a heavy business logic, PHP alone is not enough. If you plan to maintain or extend your application in the future, you will need your code to be lightweight, readable and performant. If you want to use the latest advances in user interaction (like <city><place>AJAX</place></city>) in an intuitive way, you can't just write hundreds of lines of Javascript. If you want to have fun and develop fast, then PHP alone will probably be disappointing. For all these cases, symfony is made for you.

反之，如果你正要开发一个较大型的项目，由大量的业务逻辑需要处理，那么仅仅有PHP就不够了。如果你打算在未来维护或者扩展你的应用程序，那么你需要让你的代码保持轻量级，可读并且高性能。如果你想用一种比较直接的方式采用一些最新技术在用户交互方面的优势，如Ajax，而不用编写成千上万行的Javascript代码。如果你想让开发高效并且充满乐趣，那么仅采用PHP进行开发将会令你失望。如果你碰到了上述所有情况的一种，那么，symfony就是为你而生的！

And of course, if you are a profesional web developer, you already know all the benefits of web application frameworks, and you need one which is mature, well documented, and with a large community. Search no more, for symfony is your solution.

当然，如果你是一个专业的web开发者，你当然已经知道了web应用程序框架的优势，你所需要的是一个成熟的，有良好文档支持的，有一个大型交互社区的框架。不用再寻找了，symfony就是合适你的解决方案!

Translated by coofucoo

<chsdate year="2006" month="4" day="19" islunardate="False" isrocdate="False"><span style="font-size: 12pt">4/19/2006</span></chsdate>

]]\>

