---
layout: post
title: build androd on centos 64bit
date: 2016-03-08 23:15:35.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _edit_last: '1'
  dsq_thread_id: '4644811241'
author: 
permalink: "/2016/03/build-androd-on-centos-64bit.html"
---
android sdk i386支持

sudo yum install glibc.i686  
sudo yum install libstdc++.i686  
sudo yum install ncurses-libs.i686  
sudo yum install zlib.i686

android update sdk --no-ui --filter support-v4  
更新制定sdk  
tools/android update sdk --no-ui  
更新sdk  
echo y | ./tools/android update sdk --no-ui --all --filter "extra-android-support"  
更新 android support

