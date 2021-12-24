---
layout: post
title: php 里面 的language struct
date: 2008-01-18 13:37:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2008/01/php-%e9%87%8c%e9%9d%a2-%e7%9a%84language-struct.html"
---
变量函数不能用于语言结构，例如 [**echo()**](mk:@MSITStore:C: Documents%20and%20Settings zhangjiayin 桌面 php_manual_zh.chm::/function.echo.html)，[**print()**](mk:@MSITStore:C: Documents%20and%20Settings zhangjiayin 桌面 php_manual_zh.chm::/function.print.html)，[**unset()**](mk:@MSITStore:C: Documents%20and%20Settings zhangjiayin 桌面 php_manual_zh.chm::/function.unset.html)，[**isset()**](mk:@MSITStore:C: Documents%20and%20Settings zhangjiayin 桌面 php_manual_zh.chm::/function.isset.html)，[**empty()**](mk:@MSITStore:C: Documents%20and%20Settings zhangjiayin 桌面 php_manual_zh.chm::/function.empty.html)，[**include()**](mk:@MSITStore:C: Documents%20and%20Settings zhangjiayin 桌面 php_manual_zh.chm::/function.include.html)，[**require()**](mk:@MSITStore:C: Documents%20and%20Settings zhangjiayin 桌面 php_manual_zh.chm::/function.require.html) 以及类似的语句。需要使用自己的外壳函数来将这些结构用作变量函数。

还有 就是 就是有一个误解

