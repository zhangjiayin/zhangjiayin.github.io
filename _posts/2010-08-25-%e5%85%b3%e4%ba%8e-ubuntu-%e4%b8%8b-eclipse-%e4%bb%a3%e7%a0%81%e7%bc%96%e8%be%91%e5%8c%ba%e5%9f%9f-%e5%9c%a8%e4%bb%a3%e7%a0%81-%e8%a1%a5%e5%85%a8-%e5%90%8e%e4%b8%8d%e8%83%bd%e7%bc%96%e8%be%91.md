---
layout: post
title: 关于 ubuntu 下 eclipse  代码编辑区域 在代码 补全 后不能编辑 的笔记
date: 2010-08-25 12:25:24.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  aktt_notify_twitter: 'no'
  _edit_last: '1'
  dsq_thread_id: '4543641170'
author: 
permalink: "/2010/08/%e5%85%b3%e4%ba%8e-ubuntu-%e4%b8%8b-eclipse-%e4%bb%a3%e7%a0%81%e7%bc%96%e8%be%91%e5%8c%ba%e5%9f%9f-%e5%9c%a8%e4%bb%a3%e7%a0%81-%e8%a1%a5%e5%85%a8-%e5%90%8e%e4%b8%8d%e8%83%bd%e7%bc%96%e8%be%91.html"
---
以前没有发现这个问题， 今天下了一个eclipse3.6 装了之后，发现编辑代码时，补全之后 编辑器貌似还在获得焦点，  
但是不能type 字符，很奇怪，  
google 了一下，没有找到，解决方案，  
这次baidu很出息，找到是scim问题， 据说还是一个老问题，

修改  
/etc/X11/xinit/xinput.d/scim  
将原来的  
GTK\_IM\_MODULE=xim  
QT\_IM\_MODULE=xim  
改成  
GTK\_IM\_MODULE=scim  
QT\_IM\_MODULE=scim

之前在切换 terminal 的之后， 开始的时候键盘反应慢的问题也解决了。

