---
layout: post
title: diffrient  stdout and stderr redirect between csh & bash
date: 2010-03-15 19:41:02.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  aktt_notify_twitter: 'no'
  _edit_last: '1'
  dsq_thread_id: '4543641129'
author: 
permalink: "/2010/03/diffrient-stdout-and-stderr-redirect-between-csh-bash.html"
---
csh : (ls \*.txt \> list.html ) \>& list.stderr  
bash: ls \*.txt \> list.html 2\>&1

