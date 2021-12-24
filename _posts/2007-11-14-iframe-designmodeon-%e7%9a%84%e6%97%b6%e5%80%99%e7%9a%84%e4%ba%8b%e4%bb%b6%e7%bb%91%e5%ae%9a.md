---
layout: post
title: iframe designMode="on" 的时候的事件绑定
date: 2007-11-14 18:21:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/11/iframe-designmodeon-%e7%9a%84%e6%97%b6%e5%80%99%e7%9a%84%e4%ba%8b%e4%bb%b6%e7%bb%91%e5%ae%9a.html"
---
ttp://www.w3.org/TR/html4/loose.dtd"\>http://www.w3.org/TR/html4/loose.dtd"\>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Example page with editable iframe where key events are handled</title>

<script type="text/javascript"></script>

function keyPressHandler (evt) {

evt = evt || window.event;

if (evt) {

