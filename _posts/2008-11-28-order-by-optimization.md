---
layout: post
title: ORDER BY Optimization
date: 2008-11-28 16:57:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _edit_last: '1'
  aktt_notify_twitter: 'no'
  dsq_thread_id: '4543641047'
author: 
permalink: "/2008/11/order-by-optimization.html"
---
```
http://dev.mysql.com/doc/refman/5.0/en/order-by-optimization.html

SELECT * FROM t1
ORDER BY_`key_part1`_,_`key_part2`_,... ;

SELECT * FROM t1
WHERE_`key_part1`_=_`constant`_
ORDER BY_`key_part2`_;

SELECT * FROM t1
ORDER BY_`key_part1`_DESC,_`key_part2`_DESC;

SELECT * FROM t1
WHERE_`key_part1`_=1
ORDER BY_`key_part1`_DESC,_`key_part2`_DESC;
```

