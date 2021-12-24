---
layout: post
title: javascript 内存管理  避免内存泄漏 [ajax in action]
date: 2007-12-12 13:44:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  dsq_thread_id: '6234105931'
author: 
permalink: "/2007/12/javascript-%e5%86%85%e5%ad%98%e7%ae%a1%e7%90%86-%e9%81%bf%e5%85%8d%e5%86%85%e5%ad%98%e6%b3%84%e6%bc%8f-ajax-in-action.html"
---
任何程序都有可能发生内存“泄漏”（即申请了系统内存并且在工作完成后没有释放)，并且对于使用非托管语言（unmanaged languages）（如C语言）的开发者来说，内存的分配和释放是一个主要的关注点。JavaScript是一种内存托管（memory-managed）的语言，垃圾回收过程能够帮助程序员自动地处理内存的分配和释放。该机制解决了大部分困扰的非托管代码的问题，但是，认为内存托管语言不会产生内存泄漏却是错误的。

垃圾回收进程尝试推断何时可以安全地回收不再使用的变量，通常是通过判定程序是否能够通过变量之间形成的引用网络到达该变量。当确信变量是不可达的，就在它上面标上可以回收的记号，并且在回收器的下一次清理中（可能在未来的任意时刻)释放相关的内存。在托管语言中产生内存泄漏非常简单：只需使用完变量而忘记解除引用。

我们来考虑一个简单的例子，其中定义了一个描述家庭宠物及其主人的对象模型。首先看看主人，以Person对象描述：

function Person(name){

this.name=name;

this.pets=new Array();

}

一个主人可以养一只或者多只宠物。当主人得到了一只宠物，他告诉宠物现在自己是它的主人：

Person.prototype.addPet=function(pet){

this.pets[pet.name]=pet;

if (pet.assignOwner){

