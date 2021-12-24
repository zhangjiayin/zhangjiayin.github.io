---
layout: post
title: python  去utf-8 bom
date: 2007-12-21 11:41:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  dsq_thread_id: '4543641027'
author: 
permalink: "/2007/12/python-%e5%8e%bbutf-8-bom.html"
---
#!/usr/bin/python  
#-\*- coding: utf-8 -\*-  
import os  
import codecs  
import time

from sys import \*

\_\_trim\_ext\_array\_\_ = ("php", "js")

def trimBom(filename):

