---
layout: post
title: Memcache存储的Session类
date: 2007-04-10 19:58:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/04/memcache%e5%ad%98%e5%82%a8%e7%9a%84session%e7%b1%bb.html"
---
| |
| |
| 

| | 

<font color="#000000" size="2">使用基于文件的Session存取瓶颈可能都是在磁盘IO操作上，所以对付小数据量的Session没有问题，但是如果碰到大数据量的Sesstion，那么可能无法胜任，现在利用Memcache来保存Session数据，直接通过内存的方式，效率自然能够提高不少，并且如果结合PHP的Memcache扩展，能够支持分布式的Memcache服务器，那么这个性能就能够提到更高，负载更多更复杂的应用。</font>

<font size="2">说明：以下代码基于Memcache来保存Session数据，客户端必须安装有PHP的Memcache扩展，否则无法运行，同时本代码没有经过严格测试，只是作为学习代码。</font>

php  
//===========================================  
 // 程序：Memcache-Based Session Class  
 // 功能：基于Memcache存储的 Session 功能类  
 // 作者: heiyeluren  
 // 博客: http://blog.csdn.net/heiyeshuwu  
 // 时间: 2006-12-23  
 //===========================================  

/\*\*  
 \* 类名: FileSession Class  
 \* 功能: 自主实现基于Memcache存储的 Session 功能  
 \* 描述: 这个类就是实现Session的功能, 基本上是通过设置客户端的Cookie来保存SessionID,  
 \*

 |

 |

