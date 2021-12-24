---
layout: post
title: static hostname to   special module  -zend framework
date: 2010-02-26 16:36:47.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- php
tags: []
meta:
  aktt_notify_twitter: 'no'
  _edit_last: '1'
  dsq_thread_id: '4543641110'
author: 
permalink: "/2010/02/static-hostname-to-special-module-zend-frameword.html"
---
麻烦的zend&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tnnd 手册也不全  
'sso' =\> array(  
'type' =\> 'Zend\_Controller\_Router\_Route\_Hostname',  
'route' =\> 'sso.xxxxxx.com',  
'defaults' =\> array(  
'module' =\> 'sso',  
'controller'=\>'index',  
'action'=\> 'index'  
),

'chains' =\>&nbsp; array(  
array(  
'type'=\>'Zend\_Controller\_Router\_Route',  
'route'=\>':controller/:action',  
'defaults' =\> array(  
'module'&nbsp;&nbsp;&nbsp;&nbsp; =\> 'sso',  
'controller' =\> 'index',  
'action'&nbsp;&nbsp;&nbsp;&nbsp; =\> 'index'  
)  
)  
)  
)

大概是这么写的

