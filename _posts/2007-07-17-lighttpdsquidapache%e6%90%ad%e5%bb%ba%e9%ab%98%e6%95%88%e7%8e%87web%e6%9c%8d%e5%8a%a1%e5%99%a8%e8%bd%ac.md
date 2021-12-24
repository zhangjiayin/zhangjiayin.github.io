---
layout: post
title: Lighttpd+Squid+Apache搭建高效率Web服务器[转]
date: 2007-07-17 18:40:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/07/lighttpdsquidapache%e6%90%ad%e5%bb%ba%e9%ab%98%e6%95%88%e7%8e%87web%e6%9c%8d%e5%8a%a1%e5%99%a8%e8%bd%ac.html"
---
## 架构原理

源: [http://blog.sina.com.cn/u/4cbfbde50100093l](http://blog.sina.com.cn/u/4cbfbde50100093l)

[<font color="#000033">Apache</font>](http://www.apache.org/)通常是开源界的首选Web服务器，因为它的强大和可靠，已经具有了品牌效应，可以适用于绝大部分的应用场合。但是它的强大有时候却显得笨重，配置文件得让人望而生畏，高并发情况下效率不太高。而轻量级的Web服务器[<font color="#000033">Lighttpd</font>](http://lighttpd.net/)却 是后起之秀，其静态文件的响应能力远高于Apache，据说是Apache的2-3倍。Lighttpd的高性能和易用性，足以打动我们，在它能够胜任的 领域，尽量用它。Lighttpd对PHP的支持也很好，还可以通过Fastcgi方式支持其他的语言，比如Python。

毕竟Lighttpd是轻量级的服务器，功能上不能跟Apache比，某些应用无法胜任。比如Lighttpd还不支持缓存，而现在的绝大部分站点 都是用程序生成动态内容，没有缓存的话即使程序的效率再高也很难满足大访问量的需求，而且让程序不停的去做同一件事情也实在没有意义。首先，Web程序是 需要做缓存处理的，即把反复使用的数据做缓存。即使这样也还不够，单单是启动Web处理程序的代价就不少，缓存最后生成的静态页面是必不可少的。而做这个 是 [<font color="#000033">Squid</font>](http://www.squid-cache.org/)的强项，它本是做代理的，支持高效的缓存，可以用来给站点做反向代理加速。把Squid放在Apache或者Lighttpd的前端来缓存 Web服务器生成的动态内容，而Web应用程序只需要适当地设置页面实效时间即可。

即使是大部分内容动态生成的网站，仍免不了会有一些静态元素，比如图片、JS脚本、CSS等等，将Squid放在Apache或者Lighttp前 端后，反而会使性能下降，毕竟处理HTTP请求是Web服务器的强项。而且已经存在于文件系统中的静态内容再在Squid中缓存一下，浪费内存和硬盘空 间。因此可以考虑将Lighttpd再放在Squid的前面，构成 Lighttpd+Squid+Apache的一条处理链，Lighttpd在最前面，专门用来处理静态内容的请求，把动态内容请求通过proxy模块转 发给Squid，如果Squid中有该请求的内容且没有过期，则直接返回给Lighttpd。新请求或者过期的页面请求交由Apache中Web程序来处 理。经过Lighttpd和Squid的两级过滤，Apache需要处理的请求将大大减少，减少了Web应用程序的压力。同时这样的构架，便于把不同的处 理分散到多台计算机上进行，由Lighttpd在前面统一把关。

在这种架构下，每一级都是可以进行单独优化的，比如Lighttpd可以采用异步IO方式，Squid可以启用内存来缓存，Apache可以启用MPM 等，并且每一级都可以使用多台机器来均衡负载，伸缩性很好。

## 实例讲解

下面以daviesliu.net和rainbud.net域下面的几个站点为例来介绍一下此方案的具体做法。daviesliu.net域下有几个用 [<font color="#000033">mod_python</font>](http://www.modpython.org/)实现的[<font color="#000033">blog站点</font>](http://blog.daviesliu.net/)，几个php的站点，一个[<font color="#000033">mod_python的小程序</font>](http://share.daviesliu.net/)，以后可能还会架设几个PHP和[<font color="#000033">Django</font>](http://www.djangoproject.com/)的站点。而服务器非常弱，CPU为Celeron 500，内存为PC 100 384M，因此比较关注Web服务器的效率。这几个站点都是采用虚拟主机方式，开在同一台机器的同一个端口上。

Lighttpd服务于80端口，Squid运行在3128端口，Apache运行在81端口。

### Lighttpd的配置

多个域名采用/var/www/domain/subdomain 的目录结构，用evhost模块配置document-root如下：

> evhost.path-pattern

