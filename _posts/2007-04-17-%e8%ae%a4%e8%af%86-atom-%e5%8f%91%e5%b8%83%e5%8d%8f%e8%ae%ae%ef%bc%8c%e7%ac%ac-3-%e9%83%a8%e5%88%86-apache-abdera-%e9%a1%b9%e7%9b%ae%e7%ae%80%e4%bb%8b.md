---
layout: post
title: '认识 Atom 发布协议，第 3 部分: Apache Abdera 项目简介'
date: 2007-04-17 18:37:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/04/%e8%ae%a4%e8%af%86-atom-%e5%8f%91%e5%b8%83%e5%8d%8f%e8%ae%ae%ef%bc%8c%e7%ac%ac-3-%e9%83%a8%e5%88%86-apache-abdera-%e9%a1%b9%e7%9b%ae%e7%ae%80%e4%bb%8b.html"
---
| ![](http://www.ibm.com/i/c.gif) | 

| |

| |

| |

| 

| ![](http://www.ibm.com/i/c.gif) | | 

<font color="#5c81a7" size="2"></font>

 |

 |

 |

级别: 中级

[<font color="#996699">James Snell</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp3/index.html#author) ([<font color="#5c81a7">jasnell@us.ibm.com</font>](mailto:jasnell@us.ibm.com?subject=Apache Abdera 项目简介&cc=dwxed@us.ibm.com)), 软件工程师, IBM

2007 年 1 月 26 日

> 本系列的前几期介绍了 Atom 发布协议（Publishing Protocol），描述了在实际应用程序中使用的各种方式。本文将举例说明如何使用一个新的开放源代码项目 Abdera 实现支持 Atom 的应用程序，该项目目前处于 Apache Software Foundation 孵化阶段。
> 
> 本文假设您已经阅读过 Atom Format 规范，对连锁有一定了解（请参阅 [<font color="#996699">参考资料</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp3/index.html#resources)）。所有的例子都是用 Java 编写，并提供了包含全部代码例子的 Eclipse 项目供您下载。

<font color="#000000">开始</font>

首先要保证安装了 Apache Abdera 的当前版本。源代码可以从 Apache Subversion 资料库（[<font color="#5c81a7">http://svn.apache.org/repos/asf/incubator/abdera/java/branches/0.2.0-incubating/</font>](http://svn.apache.org/repos/asf/incubator/abdera/java/branches/0.2.0-incubating/)）下载。要检索源代码，需要安装 subversion 客户机并使用下面的命令：

| 
```
> svn co http://svn.apache.org/repos/asf/incubator/abdera/java/branches/0.2.0-incubating/
```
 |

下载源代码镜像之后，就可以使用 Ant 1.6.5 或更高版本构建 Abdera 了。

| 
```
> cd trunk
> ant -f build/build.xml dist
```
 |

构建完成之后，编译后的 jar 和依赖关系文件存放在新建的 “dist” 目录中。运行本文中的例子需要在类路径中包含下列 jar。并非所有例子都需要依赖关系列表中的全部 jar：

<caption>
<strong><font color="#ffffff">表 1. 运行示例需要的 jar</font></strong> </caption>| Abdera (dist) | 依赖关系（dist/lib） |
| --- | --- |
| 
- abdera.client.0.2.0-incubating.jar 
- abdera.core.0.2.0-incubating.jar 
- abdera.parser.0.2.0-incubating.jar 
- abdera.protocol.0.2.0-incubating.jar 
 | 
- axiom-api-1.0.jar 
- axiom-impl-1.0.jar 
- commons-codec-1.3.jar 
- commons-httpclient-3.0.1.jar 
- commons-logging-1.0.4.jar 
- geronimo-activation\_1.0.2\_spec-1.1.jar 
- log4j-1.2.12.jar 
- stax-1.1.2-dev.jar 
- stax-api-1.0.jar 
- jaxen-1.1-beta-7.jar 
 |

<font color="#000000">起步</font>

Abdera 项目包含一组独立的模块，下表按字母顺序列出了这些模块。当然，最重要也是最常用的模块是 core、dependencies 和 parser：

<caption>
<strong><font color="#ffffff">表 2. Apache Abdera 项目模块</font></strong> </caption>| 模块 | 说明 | 依赖关系 |
| --- | --- | --- |
| build | 整个项目的 Ant 构建 | Apache Ant 1.6.5+ |
| client | Atom Publishing Protocol Client | core, parser, protocol, commons-codec-1.3.jar, commons-httpclient-3.0.1.jar |
| core | Feed Object Model 接口 | Java Activation Framework, commons-logging-1.0.4.jar, log4j-1.2.12.jar |
| dependencies | 所有模块共用的依赖关系 | |
| extensions | 提要语法和协议扩展 | core, protocol, json-1.0.jar |
| parser | StAX 和基于 Axiom 的默认 Feed Object Model （FOM）实现 | core, axiom-api-1.0.jar, axiom-impl-1.0.jar, stax-1.1.2-dev.jar, stax-api-1.0.jar, jaxen-1.1-beta-7.jar |
| protocol | Common Atom Publishing Protocol 代码 | core, parser |
| security | XML Digital Signature 和 Encryption 支持 | core, parser, xmlsec-1.3.0.jar, Bouncy Castle JCE 实现 |
| server | Atom Publishing Protocol 服务器实现 | core, parser, protocol, Servlet API |

下表列出了 core 模块中的包，该模块定义了 Abdera 所称的 “Feed Object Model”，它是按照 Atom Syndication Format 规范建模的一组接口，用于解析、创建和操作 Atom 文档。

<caption>
<strong><font color="#ffffff">表 3. Abdera “core” 模块中的包</font></strong> </caption>| 包 | 说明 |
| --- | --- |
| org.apache.abdera | 主包，包含一个 “Abdera” 对象 |
| org.apache.abdera.factory | 定义了创建新的 Feed Object Model 对象实例的 Factory 接口 |
| org.apache.abdera.filter | 定义了在解析过程中筛选 ATom 文档的接口 |
| org.apache.abdera.model | 定义了处理 Atom Feed 和 Entry 文档的基本接口，该模型还包括处理 Atom Publishing Protocol Service 和 Category 文档的支持。 |
| org.apache.abdera.parser | 定义了从 XML 文档创建 Feed Object Model 新的对象实例的 Parser 接口 |
| org.apache.abdera.util | 提供了各种工具类，主要针对希望扩展或替换 Abdera 默认解析器和工厂实现的开发人员 |
| org.apache.abdera.writer | 定义了用于序列化 Feed Object Model 对象实例的 Write 接口 |
| org.apache.abdera.xpath | 定义了使用 XPath 导航 Feed Object Model 的接口 |

下载并构建 Abdera 源代码后，如果需要的话，可以花点时间通过浏览构建过程中生成的 Javadoc 文档（位于创建的 $ABDERA\_HOME/dist/docs 目录下）来熟悉这种 API。

<font color="#000000">创建记录和提要</font>

Abdera Feed Object Model 的两个主要功能是简化 Atom 提要和记录文档的生产与消费。

创建 Atom 文档首先要获得 org.apache.abdera.factory.Factory 的实例并设置提要或记录的属性。清单 1 显示了一个简单 Atom Entry Document 的创建：

**<font color="#000000">清单 1. 创建简单的 Atom Entry 文档</font>**

| 
```

```
 |

