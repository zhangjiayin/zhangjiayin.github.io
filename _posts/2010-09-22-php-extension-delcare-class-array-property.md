---
layout: post
title: php extension 声明类属性
date: 2010-09-22 17:18:48.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- php
tags:
- php
meta:
  aktt_notify_twitter: 'no'
  _edit_last: '1'
  _oembed_23f034028d0894c4e7fb2b1b410c3878: "{{unknown}}"
  _oembed_ba01aaa4c5bfc35151b35730b16ae611: "{{unknown}}"
  _oembed_6610642dea1cc7f863f2426bb5fc13cf: "{{unknown}}"
  _oembed_857399265378324c1ab9d28a56d192a5: "{{unknown}}"
  dsq_thread_id: '4543641169'
  _oembed_8258cbd246f402ba08ef38c224364c36: "{{unknown}}"
  _oembed_e35391ce1e742b88dbc8b462a6e3ea12: "{{unknown}}"
author: 
permalink: "/2010/09/php-extension-delcare-class-array-property.html"
---
在弄一个php扩展， 想把 扩展写成类的 形式， 于是在声明的时候 想给类加个array 属性  
于是expect 代码是这样的

```
PHP_MINIT_FUNCTION(concurrency)
{
	zend_class_entry ce;
	INIT_CLASS_ENTRY(ce, PHP_CONCURRENCY_CLASSNAME, concurrency_class_methods);
	concurrency_class_entry = zend_register_internal_class(&ce TSRMLS_CC);

	zval *requests;

	MAKE_STD_ZVAL(requests);

	array_init(requests);

	zend_printf("%d", requests->type);
	zend_declare_property(concurrency_class_entry, "requests", strlen("requests"), requests, ZEND_ACC_PUBLIC);

	return SUCCESS;
}
```

结果报错，  
PHP Fatal error: Internal zval's can't be arrays, objects or resources in Unknown on line 0  
把requests-\>type 用zend\_printf打出来发现 结果是4 是 ZEND定义的IS\_ARRAY,  
继续翻代码  
发现在Zend/zend\_API.c 里面zend\_declare\_property的原型 有这样的定义

```
if (ce->type & ZEND_INTERNAL_CLASS) {
		switch(Z_TYPE_P(property)) {
			case IS_ARRAY:
			case IS_CONSTANT_ARRAY:
			case IS_OBJECT:
			case IS_RESOURCE:
				zend_error(E_CORE_ERROR, "Internal zval's can't be arrays, objects or resources");
				break;
			default:
				break;
		}
	}
```

不知何意看  
staceflow 上也有人遇到这种问题  
http://stackoverflow.com/posts/1105360/revisions  
，没办法，  
于是就改成在构造函数里面 增加属性的声明  
just as follow

```
PHP_METHOD(Concurrency, __construct)
{
	zval *pThis;
	pThis = getThis();
	
	zval *requests;
	MAKE_STD_ZVAL(requests);
	array_init(requests);

	add_property_zval_ex(pThis, "requests", sizeof("requests"), requests);
}
```

在这里记下！

