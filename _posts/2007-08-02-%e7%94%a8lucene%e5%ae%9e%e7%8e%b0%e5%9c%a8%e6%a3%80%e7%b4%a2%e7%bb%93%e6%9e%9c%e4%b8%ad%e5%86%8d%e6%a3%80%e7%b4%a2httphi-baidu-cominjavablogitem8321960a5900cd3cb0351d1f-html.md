---
layout: post
title: 用Lucene实现在检索结果中再检索[http://hi.baidu.com/injava/blog/item/8321960a5900cd3cb0351d1f.html]
date: 2007-08-02 15:07:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/08/%e7%94%a8lucene%e5%ae%9e%e7%8e%b0%e5%9c%a8%e6%a3%80%e7%b4%a2%e7%bb%93%e6%9e%9c%e4%b8%ad%e5%86%8d%e6%a3%80%e7%b4%a2httphi-baidu-cominjavablogitem8321960a5900cd3cb0351d1f-html.html"
---
Lucene是可以做到的，利用lucene的Filter，具体可以查看lucene的api中的org.apache.lucene.search.CachingWrapperFilter，它可以缓存上次的搜索结果，从而实现在结果中的搜索。

测试实例：  
package com.wsjava;  
import java.io.IOException;  
import org.apache.lucene.analysis.SimpleAnalyzer;  
import org.apache.lucene.document.Document;  
import org.apache.lucene.document.Field;  
import org.apache.lucene.index.IndexWriter;  
import org.apache.lucene.queryParser.ParseException;  
import org.apache.lucene.queryParser.QueryParser;  
import org.apache.lucene.search.CachingWrapperFilter;  
import org.apache.lucene.search.Filter;  
import org.apache.lucene.search.Hits;  
import org.apache.lucene.search.IndexSearcher;  
import org.apache.lucene.search.Query;  
import org.apache.lucene.search.QueryFilter;

public class IndexTest {

