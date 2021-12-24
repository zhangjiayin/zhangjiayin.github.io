---
layout: post
title: apache mod_proxy 安装
date: 2007-12-10 12:34:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/12/apache-mod_proxy-%e5%ae%89%e8%a3%85.html"
---
| 

<font size="3">在Linux系统下，需要给已经运行的Apache增加mod_proxy模块，编译的时候应该这样：</font>

<font face="Tahoma">apxs -c -i mod_proxy.c proxy_util.c</font>

<font size="3">否则你可能会收到这样的错误信息</font>

如果还需要其他proxy模块如mod\_proxy\_http、mod\_proxy\_ftp，则单独

<font size="2">apxs -c -i proxy_http.c <br>
            apxs -c -i proxy_ftp.c</font>

 |

]]\>

