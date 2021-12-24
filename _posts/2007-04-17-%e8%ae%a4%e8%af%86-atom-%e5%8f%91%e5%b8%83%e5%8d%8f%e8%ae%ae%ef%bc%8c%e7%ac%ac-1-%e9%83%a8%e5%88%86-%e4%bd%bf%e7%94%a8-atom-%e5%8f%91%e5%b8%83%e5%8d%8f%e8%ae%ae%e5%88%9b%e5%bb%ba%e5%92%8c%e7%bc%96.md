---
layout: post
title: '认识 Atom 发布协议，第 1 部分: 使用 Atom 发布协议创建和编辑 Web 资源'
date: 2007-04-17 18:31:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/04/%e8%ae%a4%e8%af%86-atom-%e5%8f%91%e5%b8%83%e5%8d%8f%e8%ae%ae%ef%bc%8c%e7%ac%ac-1-%e9%83%a8%e5%88%86-%e4%bd%bf%e7%94%a8-atom-%e5%8f%91%e5%b8%83%e5%8d%8f%e8%ae%ae%e5%88%9b%e5%bb%ba%e5%92%8c%e7%bc%96.html"
---
| 

介绍协议的基本操作

![](http://www.ibm.com/i/c.gif)

 | |

| ![](http://www.ibm.com/i/c.gif) | 

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

[<font color="#996699">James Snell</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#author) ([<font color="#5c81a7">jasnell@us.ibm.com</font>](mailto:jasnell@us.ibm.com?subject=使用 Atom 发布协议创建和编辑 Web 资源&cc=dwxed@us.ibm.com)), 软件工程师, IBM

2007 年 1 月 23 日

> Atom 发布协议（Publishing Protocol）是一种重要的内容发布和管理新标准。本文从高层概述了该协议及其基本操作和能力。

在过去几年中，Web 内容连锁技术在互联网上以及防火墙后面变得越来越重要。2005 年 7 月，互联网工程任务组（IETF）的 Atom Publishing Format and Protocol 工作组（简称为 “atompub”）发布了两个标准规范中的第一个，目标是提供 “用于表示的提要格式和用于编辑 Web 资源的协议，如 Weblog、在线日志、Wiki 以及类似的内容。” 此后，通常被称为 Atom 1.0 的 Atom 连锁格式（Syndication Format），部署到了成千上万个网站上，并得到了市场上所有主要连锁平台的支持。今天，仅仅过了一年之后，两个规范中的第二个也将宣告完成，即 Atom 发布协议（Publishing Protocol）。

Atom 发布协议是一种基于 HTTP 的用于创建和编辑 Web 资源的方法。它基本上围绕着这样一种观念设计，即利用 HTTP 协议提供的基本操作（如 GET、PUT 和 DELETE）传输表示 blog 项、博客、wiki 页面、日程记录等内容的 Atom 1.0 Feed and Entry 文档实例。

后面的讨论将带领您初步了解该协议的基本操作。本文假定读者非常熟悉使用 Atom 1.0 Syndication Format 的内容连锁，并对 HTTP 有基本的了解。阅读这篇概述文章的同时，建议您在手头上有 Atom 1.0（RFC 4287）和 HTTP 1.1（RFC 2616）规范的副本，作为涉及到的各种元素和方法的交叉参考。如果不熟悉 Atom 格式，建议您看一看我去年为 developerWorks 撰写的文章，“An overview of the Atom Syndication Format”（请参阅 [<font color="#996699">参考资料</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#resources)）。

<font color="#000000">高层概述</font>

Atom 发布协议的核心是可编辑资源_集合_ 的概念，用 Atom 1.0 Feed and Entry 文档表示。_集合_ 有一个惟一的 URI。向这个 URI 发出 HTTP GET 请求将返回 Atom Feed Document。为了在提要中创建新记录，客户机需要向集合的 URI 发送 HTTP POST 请求。这些新创建的记录将分配惟一的编辑 URI。要修改这些记录，客户机只需要从集合中检索资源，修改后再放回去。要从提要中删除记录，只需要向适当的编辑 URI 发送 HTTP DELETE 请求。所有操作都是用简单的 HTTP 请求完成的，通常不会比简单的文本编辑器和命令提示更难。

**<font color="#000000">图 1. 使用简单的 HTTP 方法发布和管理内容的 Atom 发布协议</font>**  
 ![Atom 发布协议概述](http://www.ibm.com/developerworks/cn/xml/x-atompp1/overview.gif)

**<font color="#000000">清单 1. 使用开放源码的 curl HTTP 客户机和 Atom 发布端点交互</font>**

| 
```
curl -s -X POST --data-binary @entry.xml http://example.org/atom/entries
curl -s -X GET http://example.org/atom/entries/1
curl -s -X PUT --data-binary @entry.xml http://example.org/atom/entries/1
curl -s -X DELETE http://example.org/atom/entries/1
```
 |

<font color="#000000">发现可用的集合</font>

使用任何支持 APP 的服务第一步都是确定有哪些集合可用以及这些集合可能包含什么类型的资源。Atom 协议规范定义了一种被称为服务文档的 XML 格式，客户机可用它确定一个端点。

检索服务文档需要向服务文档的 URI 发送 HTTP GET 请求。

**<font color="#000000">清单 2. 从服务器上检索 APP 服务文档</font>**

| 
```
GET /servicedocument HTTP/1.1
Host: example.org
```
 |

服务器应该用一个服务文档来响应这个请求，其中列出了客户机可用的集合，如 [<font color="#996699">清单 3</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing3) 所示。

**<font color="#000000">清单 3. 简单的 APP 服务文档</font>**

| 
```
HTTP/1.1 200 OK
Date: ...
Content-Type: application/atomserv+xml; charset=utf-8
Content-Length: nnn<service xmlns="..." xmlns:atom="http://www.w3.org/2005/Atom">
 <workspace>
 <title>My Weblog</title>
 <collection href="http://www.example.org/blog/entries">
 <title>Entries</title>
 <accept>entry</accept>
 </collection>
 <collection href="http://www.example.org/blog/photos">
 <title>Photos</title>
 <accept>image/*</accept>
 </collection>
 </workspace>
</service>
```
 |

服务文档中列出的每个集合元素都代表一个容器，容器中可以存储一些内容。文档中的 workspace 元素仅用于对相关的集合进行逻辑分组。比方说，在给定的日志服务上一个用户可能有多个帐户，分别为 blog 记录、上传的文件、书签等提供不同的容器。每个服务可以用服务文档中单独的 workspace 表示。

collection 元素提供了集合的地址（href 属性）和可以添加到集合中的内容类型的列表（用 accept 元素中的 mime 类型标识）。[<font color="#996699">清单 3</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing3) 中所示的例子有两个集合，一个只接受 Atom Entry Documents，另一个只接受图像文件（如 PNG、GIF、JPEG 等）。

<font color="#000000">向集合中添加记录</font>

得到集合的地址后，我们使用 HTTP POST 方法增加新的资源，如 [<font color="#996699">清单 4</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing4) 所示。

**<font color="#000000">清单 4. 向 APP 集合中增加新记录</font>**

| 
```
POST /blog/entries HTTP/1.1
Host: www.example.org
Content-Type: application/atom+xml; charset=utf-8
Content-Length: nnn<?xml version="1.0" ?><entry xmlns="http://www.w3.org/2005/Atom">
 <title>Atom-Powered Robots Run Amok</title>
 <link href="http://example.org/2003/12/13/atom03">
 <id>urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a</id>
 <updated>2003-12-13T18:30:02Z</updated>
 <author><name>James</name></author>
 <summary>Some text.</summary>
</entry>
```
 |

[<font color="#996699">清单 4</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing4) 的例子中向 http://example.org/blog/entries 的集合中添加了一个 Atom Entry Document。集合的 URI 从 [<font color="#996699">清单 3</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing3) 所示的服务文档中取得。要注意，发出的记录必须是有效的，就是说必须有 id、author 和 updated 元素，虽然很多 APP 应用程序选择忽略或改写客户机提供的值。

对 POST 请求的成功响应（如 [<font color="#996699">清单 5</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing5) 所示）为客户机提供了两个重要信息：请求的状态（HTTP 响应代码）和新建资源的地址（包含在 Location 头部中）。

**<font color="#000000">清单 5. 成功 POST 操作的响应</font>**

| 
```
HTTP/1.1 201 Created
Date: nnnn
Content-Type: application/atom+xml; charset=utf-8
Content-Location: /blog/entries/1
Location: /blog/entries/1
ETag: "/blog/entries/1?1"
Last-Modified: Sat, 12 Aug 2006 13:40:03 GMT<?xml version="1.0" ?<
<entry xmlns="http://www.w3.org/2005/Atom" ><id>tag:example.org,2006:/blog/entries/1</id><title>Atom-Powered Robots Run Amok</title><link href="http://example.org/2003/12/13/atom03"><link rel="edit" href="http://example.org/blog/entries/1"><updated>2006-08-12T13:40:03Z</updated><author><name>James M Snell</name></author>#Some text.
```
 |

因为一些 APP 服务器可能改变记录的主要内容（比如 id、author 和 updated 元素），服务器返回的响应可能包含实际添加到集合中的记录的副本。这样客户机就可以使发送给服务器的记录和实际创建的记录保持一致。

<font color="#000000">列出集合中的记录</font>

将记录添加到集合中之后，客户机可以通过向集合的 URI 发送 GET 请求检索其成员资源的列表，如 [<font color="#996699">清单 6</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing6) 所示。

**<font color="#000000">清单 6. 检索集合中的提要</font>**

| 
```
GET /blog/entries HTTP/1.1
Host: example.org
```
 |

该请求的响应应该是一个 Atom Feed Document，其中每个记录表示集合中的一个成员资源，如 [<font color="#996699">清单 7</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing7) 所示。

**<font color="#000000">清单 7. APP 集合的 Atom Feed Document</font>**

| 
```
HTTP/1.1 200 OK
Date: ...
Content-Type: application/atom+xml; charset=utf-8
Content-Length: nnn
ETag: "/blog/entries?132"
Last-Modified: Sat, 12 Aug 2006 13:40:03 GMT<feed xmlns="http://www.w3.org/2005/Atom" xml:base="http://example.org/blog/entries">
 <id>http://example.org/blog/entries</id>
 <title>My Blog Entries</title>
 <updated>2006-08-12T13:40:03Z</updated>
 <link rel="self" href="/blog/entries">
 <link href="http://blog.example.org">
 <entry>
 <id>tag:example.org,2006:/blog/entries/1</id>
 <title>Atom-Powered Robots Run Amok</title>
 <link href="http://example.org/2003/12/13/atom03">
 <link rel="edit" href="http://example.org/blog/entries/1">
 <updated>2006-08-12T13:40:03Z</updated>
 <author><name>James</name></author>
 <summary>Some text.</summary>
 </entry>
 <entry>
 ...
 </entry>
 ...
</feed>
```
 |

可以将返回的提要看作是集合上的某种索引，和文件系统中的 “dir” 或 “ls” 命令很相似。

记录本身按照记录 updated 元素的值排列，最近更新的记录排在最前面。此外，记录列表可能需要多个 Atom Feed Document，使用所谓的分页链接串在一起，如 [<font color="#996699">清单 8</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing8) 所示。

**<font color="#000000">清单 8. 使用分页链接的提要片段</font>**

| 
```
<feed xmlns="http://www.w3.org/2005/Atom" xml:base="http://example.org/blog/entries?page2">
 <link rel="next" href="entries?page3">
 <link rel="previous" href="entries?page1">
 ...
 </feed>
```
 |

分页链接提供了一种方法，将可能很大的集合成员资源列表划分成较小的、更容易管理的子集。

<font color="#000000">编辑记录</font>

要编辑记录，客户机首先需要检索可编辑的表示。为此可以向成员的 Edit URI 发送一个 GRT 请求，如 [<font color="#996699">清单 9</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing9) 所示。这基本上相当于在本地文本编辑器中编辑文档时首先要打开文档。

**<font color="#000000">清单 9. 检索资源的可编辑表示</font>**

| 
```
GET /blog/entries/1 HTTP/1.1
Host: example.org
```
 |

对该请求的响应应该是一个如 [<font color="#996699">清单 10</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing10) 所示的 Atom Entry Document。

**<font color="#000000">清单 10. 表示可编辑资源的 Atom Entry Document</font>**

| 
```
HTTP/1.1 200 OK 
Date: nnn
Content-Type: application/atom+xml; charset=utf-8
Content-Length: nnn
ETag: "/blog/entries/1?1"
Last-Modified: Sat, 12 Aug 2006 13:40:03 GMT<?xml version="1.0" ?><entry xmlns="http://www.w3.org/2005/Atom">
 <id>tag:example.org,2006:/blog/entries/1</id>
 <title>Atom-Powered Robots Run Amok</title>
 <link href="http://example.org/2003/12/13/atom03">
 <link rel="edit" href="http://example.org/blog/entries/1">
 <updated>2006-08-12T13:40:03Z</updated>
 <author><name>James</name></author>
 <summary>Some text.</summary>
</entry>
```
 |

得到可编辑的表示之后，客户机可以对选择的记录做任何（合理的）修改，然后向记录的 Edit URI 发出 PUT 请求更新（[<font color="#996699">清单 11</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing11)）。

**<font color="#000000">清单 11. 把修改后的 Atom 记录返回服务器</font>**

| 
```
PUT /blog/entries/1 HTTP/1.1
Host: example.org
Content-Type: application/atom+xml; charset=utf-8
Content-Length: nnnn
If-Match: "/blog/entries/1?1"
If-Unmodified-Since: Sat, 12 Aug 2006 13:40:03 GMT<?xml version="1.0" ?><entry xmlns="http://www.w3.org/2005/Atom">
 <id>tag:example.org,2006:/blog/entries/1</id>
 <title>Atom-Powered Robots Run Crazy</title>
 <link href="http://example.org/2003/12/13/atom03">
 <link rel="edit" href="http://example.org/blog/entries/1">
 <updated>2006-08-12T13:40:03Z</updated>
 <author><name>John</name></author>
 <summary>Some different text.</summary>
</entry>
```
 |

要注意，PUT 请求中使用了 If-Match 和 If-Unmodified-Since 头。虽然不是必需的，但使用这些头可以让 APP 实现避免覆盖其他客户机对成员资源所做的修改。如果这些条件都不满足，服务器可以拒绝请求并通知客户机尝试修改的资源可能存在冲突。如果条件满足，服务器就会认为客户机提交的修改是可以接受的，并返回适当的成功响应。

<font color="#000000">删除记录</font>

如果客户机要从集合中删除资源，需要向 Edit URI 发送 DELETE 请求，如 [<font color="#996699">清单 12</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing12) 所示。

**<font color="#000000">清单 12. 从集合中删除资源</font>**

| 
```
DELETE /blog/entries/1 HTTP/1.1
Host: example.org
```
 |

删除成功后，该记录将不再出现在集合的 Atom 提要中，也不再能编辑。

<font color="#000000">向集合中增加媒体资源</font>

也可以向 APP 集合中增加任何媒体资源，如图片、文档、音频记录等。这些项被 APP 规范称为 _media-link 项_，因为当把这些资源增加到集合中时，服务器将创建一个 Atom 记录文档，链接到客户机提交的媒体资源。

虽然最初的设计目的仅仅是为了让 Weblog 作者能够上传需要的媒体对象并包含在文档中，但由于 Atom 发布协议支持任何媒体资源，因此非常适合各种应用程序，包括：

- 博客 
- 视频日志 
- 图库 
- Wiki 和语境应用程序 
- 文档管理 
- XML 资料库 
- 软件分发 
- 产品应用程序（如 Office Suites） 
- 等等 

创建 media-link 记录，客户机需要向集合 URI 发送 POST 请求，但包含的不是 Atom Entry Document 而是要链接的媒体资源的表示（[<font color="#996699">清单 13</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing13)）。

**<font color="#000000">清单 13. 向 APP 应用程序增加二进制图像文件</font>**

| 
```
POST /blog/photos HTTP/1.1
Host: example.org
Content-Type: image/png
Content-Length: nnnn
Slug: A trip to the beach

{binary image data}
```
 |

如果集合可以保存客户机发送的媒体资源类型，就会保存它，并创建一个 Atom Entry Document 链接到该资源，如 [<font color="#996699">清单 14</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing14) 所示。请求中包含的 Slug 头是 Atom Publishing Specification 新增加的 HTTP Entity Header，用于在创建和管理资源时把一个简单的名字和具有多种用途的成员资源关联起来。比方说，服务器可以在创建成员资源的 URI 或者设置 Atom Entry Document 中 title 元素的值时使用 slug 的值。Slug 头可以在发布 Atom 记录或者媒体资源时使用，但多用于后者。

**<font color="#000000">清单 14. 在媒体发布响应中创建的 media-link 记录</font>**

| 
```
HTTP/1.1 201 Created
Date: nnnn
Content-Location: /blog/photos/a_trip_to_the_beach
Location: /blog/photos/a_trip_to_the_beach
Content-Type: application/atom+xml; charset=utf-8
Content-Length: nnnn
Slug: A trip to the beach
ETag: "/blog/photos/a_trip_to_the_beach?1"
Last-Modified: Sat, Aug 12 2006 14:11:04 GMT<?xml version="1.0"?><entry xmlns="http://www.w3.org/2005/Atom">
 <id>tag:example.org,2006:/blog/photos/a_trip_to_the_beach</id>
 <title>A trip to the beach</title>
 <link rel="edit" href="http://example.org/blog/photos/a_trip_to_the_beach">
 <span class="boldcode"><strong><link rel="edit-media" type="image.png" href="http://example.org/blog/photos/a_trip_to_the_beach?media"></strong></span>
 <updated>2006-08-12T14:11:04Z</updated>
 <author><name>James</name></author>
 <summary>A trip to the beach</summary>
 <span class="boldcode"><strong><content type="image/png" src="http://blog.example.org/photos/a_trip_to_the_beach"></content></strong></span>
</entry>
```
 |

media-link 记录必须包含 content 元素，它的 src 属性提供了新建媒体资源的 URI。这个 URI 对于媒体资源的公共引用很方便。使用单独的 edit-media 链接可以确定用于更新媒体资源的 URI。

<font color="#000000">编辑媒体资源</font>

编辑添加到集合中的媒体资源和编辑 Atom 记录基本相同。首先通过对 eit-media 链接所指定的 URI 发送 GET 请求来检索资源的可编辑版本（[<font color="#996699">清单 15</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing15)）。

**<font color="#000000">清单 15. 检索媒体资源的可编辑表示</font>**

| 
```
GET /blog/photos/a_trip_to_the_beach?media HTTP/1.1
Host: example.org
```
 |

返回可编辑的表示之后，客户机可以做需要的任何修改，然后向 edit-media URI 发出 PUT 请求（[<font color="#996699">清单 16</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing16)）。

**<font color="#000000">清单 16. 修改媒体资源</font>**

| 
```
PUT /blog/photos/a_trip_to_the_beach?media HTTP/1.1
Host: example.org
Content-Type: image/png
Content-Length: nnn

{new binary image data}
```
 |

<font color="#000000">保护集合</font>

虽然 Atom 发布协议不要求实现使用身份验证，但最好这样做以便防止有恶意的客户机创建和修改集合成员。至少，实现应该能够使用 HTTP Basic 身份验证和 TLS/SSL 连接。但实际上，APP 客户机很可能遇到各种形式的身份验证机制。但无论采用什么形式的身份验证，服务器都应该利用标准 HTTP 风格的挑战来确定所选身份验证的类型。

比方说，如果服务器从客户机收到未经授权的请求，服务器应该返回包含 WWW-Authenticate 头的 401 Unauthorized 响应，如 [<font color="#996699">清单 17</font>](http://www.ibm.com/developerworks/cn/xml/x-atompp1/index.html#listing17) 所示。

**<font color="#000000">清单 17. 未授权请求的响应</font>**

| 
```
HTTP/1.1 401 Unauthorized
Date: nnn
WWW-Authenticate: Basic realm="my blog"
```
 |

然后，客户机可以使用适当的 Authorization 头重新发出请求。

**<font color="#000000">清单 18. 授权的请求</font>**

| 
```
POST /entries/blog HTTP/1.1
Host: example.org:443
Authorization: Basic SmFtZXM6bm90IG15IHJlYWwgcGFzc3dvcmQgOi0p
...
```
 |

<font color="#000000">使用 APP</font>

到目前为止，我讨论了 Atom 发布协议的基本操作，并通过例子示范了所有核心功能。不过，还没有讨论可以将 Atom 发布协议付诸应用的各种方法。在本系列的下一期文章中，我将介绍被认为最适合采用该协议的几种应用。其中包括一些明显的应用，如 Weblog、社区书签和照像簿类型的应用；也包括一些不那么明显的用法，比如日程表、联系人管理、文档和媒体内容资料库、数据库管理、语境应用程序，甚至面向服务体系结构。

此外，我们还将讨论如何利用 Apache Abdera 开放源码的 Atom（目前在 Apache Software Foundation 下孵化）用 Java 实现 Atom 发布客户机和服务器，最后再讨论创建支持 APP 的应用程序服务。

 |

]]\>

