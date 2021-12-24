---
layout: post
title: PHP 5.2 自带的 Filter[转]
date: 2007-05-17 19:12:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/05/php-5-2-%e8%87%aa%e5%b8%a6%e7%9a%84-filter%e8%bd%ac.html"
---
##  

今天看了 PHPWomen 的一篇 BLOG －－[Filter and PHP 5.2](http://www.phpwomen.org/wordpress/2006/11/03/filter-in-and-php-52/) 才知道 PHP 已经自带有 Filter 了，之前是需要自己手动安装扩展，现在是默认就提供了。手册中也已经提供了 [Filter 函数库](http://www.php.net/filter)的相关函数说明。Zend Developer Zone 上也已经有了一篇相关的教程－－[PHP Built in Input filtering](http://devzone.zend.com/node/view/id/1113)。

用法其实很简单，只需要知道一些常量就可以了，例如：

```
$age = filter_input(INPUT_POST, 'age', FILTER_VALIDATE_INT);
if (is_null($age)) {
```

