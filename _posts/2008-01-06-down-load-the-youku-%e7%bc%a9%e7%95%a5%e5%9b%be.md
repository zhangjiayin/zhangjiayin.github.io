---
layout: post
title: down load the youku 缩略图
date: 2008-01-06 23:54:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2008/01/down-load-the-youku-%e7%bc%a9%e7%95%a5%e5%9b%be.html"
---
<?php <br />class Crawl{  
/\*\*  
\* @autho jiayin   
\* @desc 简单爬虫游戏  
\* @param $store 为了方便 爬取以后 集中存储  
\* @method static public store() 边处理边存储  
\*\*/  
public static $flag = true;  
public static $store;  
public static function getLink($content){
