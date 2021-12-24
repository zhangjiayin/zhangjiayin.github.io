---
layout: post
title: ubuntu server  安装 pptpd （vpn服务器）
date: 2010-01-18 15:17:43.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _edit_last: '1'
  dsq_thread_id: '4543641092'
author: 
permalink: "/2010/01/ubuntu-server-%e5%ae%89%e8%a3%85-pptpd-%ef%bc%88vpn%e6%9c%8d%e5%8a%a1%e5%99%a8%ef%bc%89.html"
---
看了这位仁兄的 配置 自己也配置了一下  
[http://blog.cuoluo.cn/2009/12/install-pptp-vpn-in-linode-vps/](http://blog.cuoluo.cn/2009/12/install-pptp-vpn-in-linode-vps/)

1, 安装pptpd

apt-get install pptpd

2. 编辑 /etc/pptpd.conf文件

&nbsp;添加&nbsp;（或去掉注释，原来文件内容这两行 被注释掉了）  
localip 192.168.0.1  
remoteip 192.168.0.234-238,192.168.0.245

3修改/etc/ppp/chap-secrets 添加用户

格式这个文件里面有 基本上是

用户名 pptpd&nbsp;&nbsp;密码&nbsp; &nbsp; _ip(可用 \*)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_

_4手动配置 登陆后的dns&nbsp; 编辑文件__/etc/ppp/options&nbsp; 添加_

ms-dns 8.8.8.8  
ms-dns 8.8.4.4

5 开启ipv4 forward

修改 etc/sysctl.conf, 添加  
**net.ipv4.ip\_forward = 1**

运行下面的命令让配置生效。  
sysctl -p  
重启pptpd服务  
/etc/init.d/pptpd restart  
开启iptables转发  
/sbin/iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE

