---
layout: post
title: RSS 1.0 规范 Core Syntax(核心语法)
date: 2007-04-17 18:56:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  dsq_thread_id: '5098127914'
author: 
permalink: "/2007/04/rss-1-0-%e8%a7%84%e8%8c%83-core-syntax%e6%a0%b8%e5%bf%83%e8%af%ad%e6%b3%95.html"
---
RSS 1.0 规范 Core Syntax(核心语法)

5. Core Syntax [核心语法]  
RSS 1.0 的核心是建立在 RSS 0.9 之上的. RSS 1.0 的焦点在于通过 XML 命名空间和 RDF 得到易扩展

性的同时保持向下兼容.  
向下兼容 RSS 0.9   
基本的 RSS 解析器,模块,库对那些设计上未能理解以下内容的不予考虑,在这个前提和约定下,向下兼容

是毫无疑问的:   
属性(attribute); RSS 0.9 没有不在 RDF 命名空间声明之内的属性.

模块化的扩展部分的元素成员存在于默认命名空间之外.

特殊元素不妨碍 RSS 0.9 文档的全部结构.

通过基于 XML 命名空间的模块化的易扩展性  
RSS 1.0 通过基于 XML 命名空间的模块得以扩展. 由于鼓励特别的扩展性,自然希望能有一组被一致认同

的涵盖分类学,聚合,都柏林核心(Dublin Core)等功能性的核心模块. 请见下文的模块章节, 以及核心

RSS 1.0 模块 的记录簿.

channel, image, item, 和 textinput 元素对其子元素的一个限制是不允许包含重复的子元素( 如

<item><subject></subject><subject></subject></item> ). 这个措施仅对紧邻级别的子元素有强制作用. 对于那

些更深一级的(丰富内容或重复元素)也已经定义明确的使用 RDF 语法.

RDF  
RSS 1.0 建立在出现于 RSS 0.9 (但被 RSS 0.91 抛弃)的新生的 RDF 架构上,仅最小限度的增添以下内

容:

每一个第二级别元素 (channel, image, item, and textinput) 必须包含一个 rdf:about 属性.

一个频道级别(channel-level)的 RDF 内容表(table of contents)将 image, items 和 textinput 与近

处的 channel 联系到一块.  
为了尽可能实时保持 RSS 1.0 的 RDF 及 简朴 XML 的外观, RSS 1.0 只支持使用 核心元素中 指定类型

元素的 RDF 语法.

Mime Type

Mime类型(Mime Type)  
现在 RSS 1.0 文档的 mime-type 介绍是 application/xml. 不过给 RDF (甚至可能 RSS) 注册 mime-

type 的工作正在进行,一旦注册下来便可使用.

文件扩展名  
RSS 1.0 文档并没有明确指定文件扩展名,推荐使用 .rdf 或 .xml 中的一个,前者为首选.

编码  
RSS 0.9 只支持 ASCII 码, 而 RSS 1.0 采用 UTF-8. 使用 US-ASCII (也就是把所有127以上的字符以

nnn 的形式编码) 是和 UTF-8 (以及 ISO-8859-1, HTTP 的默认文件头编码)相符合一致的.

URL  
为确保向下兼容 RSS 0.9,只有以下模式可以包含在 url 和 link 元素中: http:, https:, ftp:.

mailto: 仅允许存在于 textinput 的 link 元素中.

实体:  
XML 保留了某些字符作为置标符(markup). RSS 文档中要用到这些字符,必须用它们的实体引用(entity

reference)替换:

\< 换成 \<   
\> 换成 \>   
& 换成 &  
下面两个实体引用也是为遵从 XML 的解析器公认有效的. 但在实用中,它们是可选的. 但是当一个句子中

有引号符且被括含在同样的符号之内使,就需要用实体引用, 如:""你好,"她说"就应该编写为""你好," 她

说".   
' 换成 '   
" 换成 "  
注意: 由于 RSS 1.0 不要求 DTD 文件, 请确保在使用上述5个外的实体引用时包含内联声明(inline

declarations). 下列 DTD 片断是很有用的兼容 HTML 的实体的资料:

[http://www.w3.org/TR/xhtml1/DTD/xhtml-special.ent](http://www.w3.org/TR/xhtml1/DTD/xhtml-special.ent)   
[http://www.w3.org/TR/xhtml1/DTD/xhtml-symbol.ent](http://www.w3.org/TR/xhtml1/DTD/xhtml-symbol.ent)   
[http://www.w3.org/TR/xhtml1/DTD/xhtml-lat1.ent](http://www.w3.org/TR/xhtml1/DTD/xhtml-lat1.ent)  
Usage example [使用示例]:

<?xml version="1.0"?>

"-//W3C//ENTITIES Latin 1 for XHTML//EN"  
 "[http://www.w3.org/TR/xhtml1/DTD/xhtml-lat1.ent](http://www.w3.org/TR/xhtml1/DTD/xhtml-lat1.ent)"\>  
%HTMLlat1;  
]\>

<rdf></rdf> xmlns:rdf="[http://www.w3.org/1999/02/22-rdf-syntax-ns](http://www.w3.org/1999/02/22-rdf-syntax-ns)#"  
 xmlns="[http://purl.org/rss/1.0/](http://purl.org/rss/1.0/)"  
\>

...  
\>内容长度:  
RSS 1.0 对元素(如 title, link, description)的应用定下了合理的内容长度, 为严格坚持向下兼容提

出的好实例也纷纷诟病 RSS 0.9 的最大字符长度.

符号:  
下面的核心元素详述中，使用了下列符号:

{something} 仅仅是 URI, 值 等等的代指.   
典型描述(model description)中使用了一个类似 DTD 的语法,这只是为了介绍的目的,并不暗示其次序.

元素的次序并不重要.   
典型描述中, ? 表示元素或属性可选.   
典型描述中, + 表示此处允许使用"一个或更多"的元素或属性.   
典型描述中, + 表示此处允许使用"零个或更多"的元素或属性.  
5.1 <?xml version="1.0"?>  
As an XML application, an RSS document is not required to begin with an XML declaration. As

a best practice suggestion and to further ensure backward compatibility with RSS 0.9 (the

specification for 0.9 required it), this specification recommends doing so.

Syntax: <?xml version="1.0"?>  
Requirement: Optional (unless specifying encoding)

作为 XML 应用, 一个 RSS 文档并不强求以一个 XML 声明开头. 但作为一个最实际的建议以及为了更进

一步保证对 RSS 0.9 的向下兼容( 0.9 的规范要求有 XML 声明),本规范建议加上这一声明.

语法: <?xml version="1.0"?>  
要求: 可选 (除非编码特别指定)

5.2 <rdf><br>
每个服从 RSS 1.0 的文档里最外面的就是 RDF 元素. 开口型的 RDF 标签将 rdf: 命名空间前缀与 RDF </rdf>

语法模式(schema)联系 (注:assocaties疑为associates之误)在一起并将 RSS 1.0 模式设为该文档的默

认命名空间.

尽管可以使用任何有效的命名空间前缀,建议文档创建者考虑标准化的"rdf:". 那些想严格向下兼容 RSS

0.9 的必需用"rdf:".

语法: <rdf xmlns:rdf="&lt;a href=" http:>http://www.w3.org/1999/02/22-rdf-syntax-ns#" </rdf>

xmlns="[http://purl.org/rss/1.0/](http://purl.org/rss/1.0/)"\>  
要求: 完全按照上面格式要求,除非有补充的命名空间声明  
子模块: (channel, image?, item+, textinput?)

5.3 <channel><br>
channel 元素包含了描述频道(channel)本身的元数据,包括一个标题,简要说明,和到所描述资源的 URL </channel>

链接(比如说:频道提供者的主页). channel 元素 rdf:about 属性的 {resource} URL 必须是该 RSS 文

档中所有 rdf:about 属性中唯一的一个并且是用来鉴别频道(channel)的 URI.一般说来,不是被描述的主

页的 URL 就是该 RSS 文件所在位置的 URL.

语法: <channel rdf:about="{resource}"><br>
要求: 必需<br>
必要属性: rdf:about<br>
子模块: (title, link, description, image?, items, textinput?)<br>
示例:</channel>

