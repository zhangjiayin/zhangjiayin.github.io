---
layout: post
title: android 模拟器设置dns
date: 2016-03-23 23:02:02.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _edit_last: '1'
  dsq_thread_id: '4686715347'
author: 
permalink: "/2016/03/android-%e6%a8%a1%e6%8b%9f%e5%99%a8%e8%ae%be%e7%bd%aedns.html"
---
[http://blog.csdn.net/as\_314159265/article/details/6956306](http://blog.csdn.net/as_314159265/article/details/6956306)

第一步：用系统的命令进入Android开发包的tools目录

cd X:\...\android-sdk-windows\tool

第二布：使用adb的shell，确认系统的各项属性

adb shell

getprop

getprop会列出系统当前的各项属性

第三步：得到模拟器的DNS地址

在结果里可以看到：

[net.dns1]: [10.0.2.3]  
[net.dns2]: [10.0.2.4]  
[net.dns3]: [10.0.2.5]  
[net.dns4]: [10.0.2.6]

第四步：把dns改成我们自己的DNS

setprop net.dns1 192.168.1.1

