---
layout: post
title: 'Implementing MVC in PHP: The View'
date: 2007-05-16 10:39:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  dsq_thread_id: '6795653948'
author: 
permalink: "/2007/05/implementing-mvc-in-php-the-view.html"
---
## Implementing MVC in PHP: The View

by [Joe Stump](http://www.onlamp.com/pub/au/1234)  
01/26/2006

This is the third article in a series about understanding MVC in PHP. The first article explained [<font color="#800080">basics of MVC programming in PHP</font>](http://www.onlamp.com/pub/a/php/2005/09/15/mvc_intro.html). The second article showed the [implementation of the Controller in MVC](http://www.onlamp.com/php/2005/11/03/mvc_controller.html). The final article is [Implementing MVC in PHP: The Model](http://www.onlamp.com/pub/a/php/2006/03/02/mvc_model.html).

[![Click here to find out more!](http://m1.2mdn.net/viewad/1319813/Rails07_general_336x280.jpg)](http://ad.doubleclick.net/click;h=v8/3554/0/0/%2a/u;94292064;1-0;0;14651468;4252-336/280;19939645/19957539/1;;~aopt=2/0/ff/0;~sscs=%3fhttp://conferences.oreillynet.com/rails/)

The presentation layer, as I call it, is the View, in common MVC terms. Its sole responsibility is to display information. It could care less about authenticating users, what the data is or, for the most part, where it came from. The only thing it has to worry about is how to render it and where to send it once rendered.

By default, the framework uses [Smarty](http://smarty.php.net/) to render the framework. I'm not here to argue semantics, but your presentation layer should consist of a template engine of some sort and a few supporting presentation layers.

The idea is that, after the Model runs, the framework hands it off to a child of the `FR_Presenter_common` class. Actually, the framework uses the `FR_Presenter::factory()` to create the presenter. Each presenter should have a `display()` method that does the actual rendering. When the factory creates the presenter, it passes the presenter the instance of the model class. The presenter then gets the model's data using its `getData()` method. From there, the presenter is free to present that data however it sees fit.

### `FR_Presenter_smarty`

The way I've created my Smarty presenter is a hybrid of two templates. I create a Smarty template, and the outer page template includes the model's template. The model class's `$pageTemplateFile` can request a particular outer template. If it does not, the default is _tpl/default/templates/page.tpl_. The _page.tpl_ template then uses the `{$modulePath}` and `{$tplFile}` directives to include the model's template. All model templates should reside in _modules/example/tpl/_.

After assigning the variables, the controller runs Smarty's display function to render the templates. With little modification, you could wrap these calls with Smarty's built-in caching as well. By using Smarty, you could enable an output modifier to output `gzip`ped code instead of plain HTML.

```

```

