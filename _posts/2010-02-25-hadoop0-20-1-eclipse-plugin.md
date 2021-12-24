---
layout: post
title: hadoop0.20.1 eclipse plugin
date: 2010-02-25 15:33:42.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- hadoop
tags: []
meta:
  aktt_notify_twitter: 'no'
  _edit_last: '1'
  _oembed_08a314748c858ce56018e34fb72678b9: "{{unknown}}"
  _oembed_a2280aa9c5480f91762888125db2e95b: "{{unknown}}"
  dsq_thread_id: '4543641106'
  _oembed_5a64d79a88a464f17259000c87d1a035: "{{unknown}}"
  _oembed_ef081251b6653ab77e55ba2bbfc8e8ee: "{{unknown}}"
author: 
permalink: "/2010/02/hadoop0-20-1-eclipse-plugin.html"
---
http://issues.apache.org/jira/browse/MAPREDUCE-1262

src/contrib/eclipse-plugin/src/java/org/apache/hadoop/eclipse/launch/HadoopApplicationLaunchShortcut.java

@@ -32,7 +32,7 @@  
-import org.eclipse.jdt.internal.debug.ui.launcher.JavaApplicationLaunchShortcut;  
+import org.eclipse.jdt.debug.ui.launchConfigurations.JavaApplicationLaunchShortcut;

@@ -65,6 +65,10 @@  
ILaunchConfiguration iConf =  
super.findLaunchConfiguration(type, configType);

+&nbsp;&nbsp;&nbsp; if(iConf == null){  
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return null;  
+&nbsp;&nbsp;&nbsp; }  
+  
ILaunchConfigurationWorkingCopy iConfWC;  
try {  
/\*

cd&nbsp; src/contrib/eclipse-plugin/

ant jar -Declipse.home=/usr/local/eclipse&nbsp;&nbsp; ///usr/local/eclipse your eclipse home

