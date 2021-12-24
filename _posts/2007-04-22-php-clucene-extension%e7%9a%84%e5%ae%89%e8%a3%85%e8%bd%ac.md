---
layout: post
title: php + clucene extension的安装[转]
date: 2007-04-22 14:37:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/04/php-clucene-extension%e7%9a%84%e5%ae%89%e8%a3%85%e8%bd%ac.html"
---
[<font color="#800080">CLucene</font>](http://clucene.sourceforge.net/)是[SF](http://www.sf.net/)上面的一个对[Lucene](http://lucene.apache.org/)(一个用Java写的全文检索引擎工具包)的移植,做为Lucene的C++的重新实现，以带来更快的检索速度,但是一直还不stable.这里仅仅是尝试php+[<font color="#800080">clucene扩展</font>](http://pecl.php.net/package/clucene)的安装,具体应用先不管.

安装环境:  
Freebsd 6.0 + apache 2.2 + php 5.1.2

[apache+php的安装](http://www.ooso.net/article/html/install.htm)就不说了,网上一抓一大把,注意clucene扩展必须在php5以上才能安装.

- 首先安装clucene 

1.下载clucene  
直奔它的首页–[<font color="#800080">clucene.sourceforge.net</font>](http://clucene.sourceforge.net/),下载clucene 0.9.10  
2.编译clucene

> tar xzvf clucene-0.9.10.tar.gz  
> cd clucene-0.9.10  
> ./autogen.sh  
> ./configure  
> make

这样clucene就安装好了,为了让其它程序可以调用clucene,这里把编译好的lib放到系统lib目录下

> cp src/.libs/libclucene.\* /usr/local/lib  
> cp src/CLucene.h /usr/local/include/  
> cp -r src/CLucene /usr/local/include/

- 安装clucene php extension 

1.下载clucene php extension  
在pecl.php.net有下载,拖回来就是  
[<font color="#800080">http://pecl.php.net/package/clucene</font>](http://pecl.php.net/package/clucene)

2.编译clucene php extension

> tar xzvf clucene-0.0.9.tgz  
> cd clucene-0.0.9  
> cp -r /usr/local/include/Clucene include/

