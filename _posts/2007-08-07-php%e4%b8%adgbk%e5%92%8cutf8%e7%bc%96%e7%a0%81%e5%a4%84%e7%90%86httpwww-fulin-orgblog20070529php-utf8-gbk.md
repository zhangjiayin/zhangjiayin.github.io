---
layout: post
title: PHP中GBK和UTF8编码处理[http://www.fulin.org/blog/2007/05/29/php-utf8-gbk/]
date: 2007-08-07 10:41:00.000000000 +08:00
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
  dsq_thread_id: '4543640955'
author: 
permalink: "/2007/08/php%e4%b8%adgbk%e5%92%8cutf8%e7%bc%96%e7%a0%81%e5%a4%84%e7%90%86httpwww-fulin-orgblog20070529php-utf8-gbk.html"
---
当我用java 解析带有特殊字符（同事称为 简体繁体 脑残体）(比如说\z)的时候就会保存  
在网上看到这篇文章 记录下来 用做过滤非显示字符

一、编码范围1. GBK (GB2312/GB18030)  
\x00-\xff GBK双字节编码范围  
\x20-\x7f ASCII  
\xa1-\xff 中文  
\x80-\xff 中文

2. UTF-8 (Unicode)  
\u4e00-\u9fa5 (中文)  
\x3130-\x318F (韩文  
\xAC00-\xD7A3 (韩文)  
\u0800-\u4e00 (日文)  
ps: 韩文是大于[\u9fa5]的字符  
正则例子:

```
preg_replace(”/([\x80-\xff])/”,”",$str);
preg_replace(”/([u4e00-u9fa5])/”,”",$str);
```

二、代码例子

```
//判断内容里有没有中文-GBK (PHP)
function check_is_chinese($s){
    return preg_match('/[\x80-\xff]./', $s);
}
//获取字符串长度-GBK (PHP)
function gb_strlen($str){
    $count = 0;
    for($i=0; $i<strlen substr if return function gb_substr for break utf8_strlen strlen ord> 127) {
            $count++;
            if($value &gt;= 192 &amp;&amp; $value &lt;= 223) $i++;
            elseif($value &gt;= 224 &amp;&amp; $value &lt;= 239) $i = $i + 2;
            elseif($value &gt;= 240 &amp;&amp; $value &lt;= 247) $i = $i + 3;
            else die('Not a UTF-8 compatible string');
        }
        $count++;
    }
    return $count;
}
//截取字符串-UTF8(PHP)
function utf8_substr($str,$position,$length){
    $start_position = strlen($str);
    $start_byte = 0;
    $end_position = strlen($str);
    $count = 0;
    for($i = 0; $i &lt; strlen($str); $i++){
        if($count &gt;= $position &amp;&amp; $start_position &gt; $i){
            $start_position = $i;
            $start_byte = $count;
        }
        if(($count-$start_byte)&gt;=$length) {
            $end_position = $i;
            break;
        }    
        $value = ord($str[$i]);
        if($value &gt; 127){
            $count++;
            if($value &gt;= 192 &amp;&amp; $value &lt;= 223) $i++;
            elseif($value &gt;= 224 &amp;&amp; $value &lt;= 239) $i = $i + 2;
            elseif($value &gt;= 240 &amp;&amp; $value &lt;= 247) $i = $i + 3;
            else die('Not a UTF-8 compatible string');
        }
        $count++;
    }
    return(substr($str,$start_position,$end_position-$start_position));
}
</strlen>
```

=============

```
//判断是否是有韩文-UTF-8 (JavaScript)
function checkKoreaChar(str) {
    for(i=0; i<str.length i if> 0x3130 &amp;&amp; str.charCodeAt(i) &lt; 0x318F) || (str.charCodeAt(i) &gt;= 0xAC00 &amp;&amp; str.charCodeAt(i) &lt;= 0xD7A3))) {
            return true;
        }
    }
    return false;
}
//判断是否有中文字符-GBK (JavaScript)
function check_chinese_char(s){
    return (s.length != s.replace(/[^\x00-\xff]/g,"**").length);
}
</str.length>
```
