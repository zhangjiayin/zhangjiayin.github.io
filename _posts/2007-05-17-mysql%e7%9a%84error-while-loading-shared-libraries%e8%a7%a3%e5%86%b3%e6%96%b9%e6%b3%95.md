---
layout: post
title: Mysql的error while loading shared libraries解决方法
date: 2007-05-17 16:09:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _edit_last: '1'
  aktt_notify_twitter: 'no'
author: 
permalink: "/2007/05/mysql%e7%9a%84error-while-loading-shared-libraries%e8%a7%a3%e5%86%b3%e6%96%b9%e6%b3%95.html"
---
找不到mysql的动态链接库，解决方法更新动态链接库文件如下  
编辑/etc/profile

加入export MYSQL\_PATH=/usr/local/mysql

在shell下执行
```
echo '$MYSQL_PATH/lib/mysql' >> /etc/ld.so.conf
ldconfig
```

