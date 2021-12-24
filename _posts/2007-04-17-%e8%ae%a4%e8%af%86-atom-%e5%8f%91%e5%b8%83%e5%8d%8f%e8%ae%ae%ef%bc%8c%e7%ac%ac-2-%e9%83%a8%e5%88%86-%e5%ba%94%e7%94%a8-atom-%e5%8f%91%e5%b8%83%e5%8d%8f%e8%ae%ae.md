---
layout: post
title: '认识 Atom 发布协议，第 2 部分: 应用 Atom 发布协议'
date: 2007-04-17 18:33:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/04/%e8%ae%a4%e8%af%86-atom-%e5%8f%91%e5%b8%83%e5%8d%8f%e8%ae%ae%ef%bc%8c%e7%ac%ac-2-%e9%83%a8%e5%88%86-%e5%ba%94%e7%94%a8-atom-%e5%8f%91%e5%b8%83%e5%8d%8f%e8%ae%ae.html"
---
级别: 中级

[<font color="#996699">James Snell</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp2/index.html#author) ([<font color="#5c81a7">jasnell@us.ibm.com</font>](mailto:jasnell@us.ibm.com?subject=应用 Atom 发布协议&cc=dwxed@us.ibm.com)), 软件工程师, IBM

2007 年 1 月 26 日

> 本系列文章的 [<font color="#996699">上一期</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/) 简要介绍了 Atom 发布协议（Atom Publishing Protocol，APP）。本文继续介绍该协议，举例说明如何用它与一些已经部署好的应用程序交互。
> 
> 与以前一样，本文假设您了解使用 Atom 1.0 Syndication Format 的内容连锁，并对 HTTP 有基本的了解。本文的例子使用 Java 1.5 编写，并使用了 Apache Software Foundation 开发的 Apache Abdera 开放源码 Atom 实现的最新预览版本。

<font color="#000000">准备开始</font>

首先要保证安装了 Apache Abdera 的当前版本。源代码可以从 Apache Subversion 资料库 [<font color="#5c81a7">http://svn.apache.org/repos/asf/incubator/abdera/java/trunk</font>](http://svn.apache.org/repos/asf/incubator/abdera/java/trunk) 下载。要检索源代码，需要安装 subversion 客户机并使用下面的命令：

| 
```
> svn co http://svn.apache.org/repos/asf/incubator/abdera/java/trunk
```
 |

下载源代码的镜像之后就可以用 Ant version 1.6.5 或更高版本构建 Abdera 了。

| 
```
> cd trunk
> ant -f build/build.xml dist
```
 |

构建完成后，编译后的 jar 和 dependency 放在新建的 dist 目录中。要运行这些例子，需要在类路径中添加下列 jar：

<caption>
<strong><font color="#ffffff">表 1. 运行例子需要的 jar</font></strong> </caption>| Abdera (dist) | Dependency (dist/lib) |
| --- | --- |
| 
- abdera.client.0.2.0-incubating-SNAPSHOT.jar 
- abdera.core.0.2.0-incubating-SNAPSHOT.jar 
- abdera.parser.0.2.0-incubating-SNAPSHOT.jar 
- abdera.protocol.0.2.0-incubating-SNAPSHOT.jar 
 | 
- axiom-api-1.0.jar 
- axiom-impl-1.0.jar 
- commons-codec-1.3.jar 
- commons-httpclient-3.0.1.jar 
- commons-logging-1.0.4.jar 
- geronimo-activation\_1.0.2\_spec-1.1.jar 
- geronimo-javamail\_1.3.1\_spec-1.1.jar 
- log4j-1.2.12.jar 
- stax-1.1.2-dev.jar 
- stax-api-1.0.jar 
 |

<font color="#000000">Weblog</font>

根据 IETF Atom Publishing Format and Protocol 工作组的章程，Atom 发布协议（Atom Publishing Protocol）的设计目标主要用于发布和管理 weblog 记录。毫不奇怪，随后很多 blogging 软件提供商如 Google、SixApart 和 Roller 已经开始初步支持该协议。

**<font color="#000000" size="3">Google 的 Blogger Beta</font>**

2006 年 8 月初，Google 宣布将对其提供的网络日记服务进行期待已久的升级。服务新增加的一个特性就是支持使用 Atom 发布协议创建和编辑公告。

创建公告非常简单。首先需要知道新记录所要发送到的 Atom 集合的 URL。对于 Blogger 来说，Atom 提要用于连锁 blog 的内容组成 Atom 发布协议集合供提要阅读器和聚合器使用。因此要确定集合的 URI，只要查看 weblog 主页头部的替代链接即可。

**<font color="#000000">清单 1. Blogger 主页的头部</font>**

| 
```

```
 |

