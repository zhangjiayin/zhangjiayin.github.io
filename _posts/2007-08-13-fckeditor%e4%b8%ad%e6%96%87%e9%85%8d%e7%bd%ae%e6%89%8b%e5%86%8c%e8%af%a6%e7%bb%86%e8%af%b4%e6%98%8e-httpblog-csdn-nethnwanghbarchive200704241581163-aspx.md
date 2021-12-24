---
layout: post
title: fckeditor中文配置手册详细说明 [http://blog.csdn.net/hnwanghb/archive/2007/04/24/1581163.aspx]
date: 2007-08-13 19:01:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta: {}
author: 
permalink: "/2007/08/fckeditor%e4%b8%ad%e6%96%87%e9%85%8d%e7%bd%ae%e6%89%8b%e5%86%8c%e8%af%a6%e7%bb%86%e8%af%b4%e6%98%8e-httpblog-csdn-nethnwanghbarchive200704241581163-aspx.html"
---
<div id="blog_text" class="cnt"  >
<div class="postText">
<div class="content">【摘要】<br />
性能</p>
<p>首先,FCKEDITOR的性能是非常好的,用户只需很少的时间就可以载入FCKEDITOR所需文件.对于其他在线编辑器来说,这几乎是个很难解决的难题,因为在开启编辑器时需要装载太多的文件.比如CUTEEDITOR,虽然功能比FCKEDITOR还要强大,可是,它本身也够庞大了,至于FREETEXTBOX等,其易用性与FCKEDITOR相比,尚有差距,可以说,FCKEDITOR是一个别具匠心的在线编辑器,它里面融入了作者高深的面向对象的JAVASCRIPT功力,集易用性与强大的功能与一体.<br />
【全文】</p>
<p>性能</p>
<p>首先,FCKEDITOR的性能是非常好的,用户只需很少的时间就可以载入FCKEDITOR所需文件.对于其他在线编辑器来说,这几乎是个很难解决的难题,因为在开启编辑器时需要装载太多的文件.比如CUTEEDITOR,虽然功能比FCKEDITOR还要强大,可是,它本身也够庞大了,至于FREETEXTBOX等,其易用性与FCKEDITOR相比,尚有差距,可以说,FCKEDITOR是一个别具匠心的在线编辑器,它里面融入了作者高深的面向对象的JAVASCRIPT功力,集易用性与强大的功能与一体.</p>
<p>.与编辑器相关的所有图像,脚本以及调用页<br />
.语言文件<br />
.编辑器的皮肤文件<br />
.工具样的贴图等</p>
<p>这些将导致在服务器和客户端间产生相当的流量.如果有许多文件被调用,那么即便每个文件很小.也会让用户等得不耐烦.</p>
<p>在2.0版中,开发人员有两种方法来解决这个问题.<br />
那就是指定装载顺序和脚本压缩</p>
<p>装载顺序<br />
从2.0版开始,编辑器按以下步骤装载资源:<br />
.基本页(就是编辑器所在页)以及装入编辑器的JS脚本<br />
.用来建立编辑器的脚本<br />
.编辑器的语言和皮肤.<br />
.建立编辑器.<br />
.载入预置的编辑文档内容.<br />
.从现在开始,用户可以阅读和编辑文档了,不过,拖拽支持以及工具栏都是不可用的<br />
.载入编辑器引擎脚本<br />
.建立工具栏,并且可用<br />
.从现在开始,编辑器的所有功能都已经完整<br />
.载入工具栏图标</p>
<p>脚本压缩</p>
<p>在打包任何新版本时,编辑器的JS脚本将会进行预处理.预处理步骤如下:<br />
.移除所有代码注释<br />
.移除所有无用的空白字符.<br />
.将脚本合并成几个文件</p>
<p>使用上面的方法,我们可以将脚本文件的大小压缩到原来的50%.<br />
压缩后,原始的代码仍然存在于一个名为_Source的文件夹中</p>
<p>如何打包?<br />
编辑器已经自带了打包程序,它位于FCKEDITOR的根文件夹中_PACKAGER文件夹中,名为Fckeditor.Packager.exe,将其复制到FCKEDITOR根文件夹中并运行,即可自动将JS脚本打包并压缩<br />
需要注意的是该程序是一个.NET程序,必须安装.NET FRAMEWORK才能使用</p>
<p>想要获取支持?<br />
如果你捐赠15000欧元,你就可以获得1年的免费技术支持(比较贵的说,相当于人民币15万,不过西欧的费用相当惊人)</p>
<p>如何安装?</p>
<p>1.下载最新版的FCKEDITOR<br />
2.解压缩到你的站点根文件夹中名为FCKEDITOR的文件夹中(名称必须为FCKEDITOR,因为配置文件中已经使用此名称来标示出FCKEDITOR的位置)<br />
3.现在,编辑器就可以使用了,如果想要查看演示,可以按下面方法访问:<br />
<a title="http://" target="_blank" href="http:///">http://</a><your-site>/FCKeditor/_samples/default.html</p>
<p>注意:你可以将FCKEDITOR放置到任何文件夹,默认情况下,将其放入到FCKEDITOR文件夹是最为简单的方法.如果你放入的文件夹使用别的名称,请修改配置文件夹中编辑器BasePath参数,如下所示:<br />
oFckeditor.BasePath="/Components/fckeditor/";</p>
<p>另外,FCKEDITOR文件夹中所有以下划线开头的文件夹及文件,都是可选的,可以安全的从你的发布中删除.它们并不是编辑器运行时必需的</p>
<p>如何将FCKEDITOR整合进我的页面?</p>
<p>由于目前的版本提供的FCKEDITOR仅提供了JAVASCRIPT式的整合,因此,这里仅讲述如何应用JAVASCRIPT来整合FCKEDITOR到站点中,当然,其他各种语言的整合,你可以参考_samples文件夹中的例子来完成<br />
1,假如编辑器已经安装在你的站点的/FCKEDITOR/文件夹下.那么,第一步我们需要做的就是在页面的HEAD段中放入SCRIPT标记以引入JAVASCRIPT整合模块.例如:<br />
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script></p>
<p>其中路径是可更改的</p>
<p>2,现在,FCKEDITOR类已经可以使用了.有两个方法在页面中建立一个FCKEDITOR编辑器:<br />
方法1:内联方式(建议使用):在页面的FORM标记内需要插入编辑器的地方置入以下代码:<br />
script type="text/javascript"><br />
var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;<br />
oFCKeditor.Create() ;<br />
</script></p>
<p>方法2:TEXTAREA标记替换法(不建议使用):在页面的ONLOAD事件中,添加以下代码以替换一个已经存在的TEXTAREA标记</p>
<p><html><br />
<head><br />
<script type="text/javascript"><br />
window.onload = function()<br />
{<br />
var oFCKeditor = new FCKeditor( 'MyTextarea' ) ;<br />
oFCKeditor.ReplaceTextarea() ;<br />
}<br />
</script><br />
</head><br />
<body><br />
<textarea id="MyTextarea" name="MyTextarea">This is <b>the</b> initial value.</textarea><br />
</body><br />
</html></p>
<p>3.现在,编辑器可以使用了</p>
<p>FCKEDITOR类参考:<br />
下面是用来在页面中建立编辑器的FCKEDITOR类的说明</p>
<p>构造器:<br />
FCKeditor( instanceName[, width, height, toolbarSet, value] )<br />
instanceName:编辑器的唯一名称(相当于ID)<br />
WIDTH:宽度<br />
HEIGHT:高度<br />
toolbarSet:工具条集合的名称<br />
value:编辑器初始化内容</p>
<p>属性:<br />
instanceName:编辑器实例名<br />
width:宽度,默认值为100%<br />
height:高度,默认值是200<br />
ToolbarSet:工具集名称,参考FCKCONFIG.JS,默认值是Default<br />
value:初始化编辑器的HTML代码,默认值为空<br />
BasePath:编辑器的基路径,默认为/Fckeditor/文件夹,注意,尽量不要使用相对路径.最好能用相对于站点根路径的表示方法,要以/结尾<br />
CheckBrowser:是否在显示编辑器前检查浏览器兼容性,默认为true<br />
DisplayErrors:是否显示提示错误,默为true;</p>
<p>集合:<br />
Config[Key]=value;<br />
这个集合用于更改配置中某一项的值,如<br />
oFckeditor.Config["DefaultLanguage"]="pt-br";</p>
<p>方法:<br />
Create()<br />
建立并输出编辑器</p>
<p>RepaceTextArea(TextAreaName)<br />
用编辑器来替换对应的文本框</p>
<p>如何配置FCKEDITOR?<br />
FCKEDITOR提供了一套用于定制其外观,特性及行为的设置集.主配置文件名为Fckconfig.js<br />
你既可以编辑主配置文件,也可以自己定义单独的配置文件.配置文件使用JAVASCRIPT语法.</p>
<p>修改后,在建立编辑器时,可以使用以下语法:<br />
var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;<br />
oFCKeditor.Config['CustomConfigurationsPath'] = '/myconfig.js' ;<br />
oFCKeditor.Create() ;</p>
<p>提醒:当你修改配置后,请清空浏览器缓存以查看效果</p>
<p>配置选项:</p>
<p>AutoDetectLanguage=true/false 自动检测语言<br />
BaseHref="" _fcksavedurl="""" 相对链接的基地址<br />
ContentLangDirection="ltr/rtl" 默认文字方向<br />
ContextMenu=字符串数组,右键菜单的内容<br />
CustomConfigurationsPath="" 自定义配置文件路径和名称<br />
Debug=true/false 是否开启调试功能,这样,当调用FCKDebug.Output()时,会在调试窗中输出内容<br />
DefaultLanguage="" 缺省语言<br />
EditorAreaCss="" 编辑区的样式表文件<br />
EnableSourceXHTML=true/false 为TRUE时,当由可视化界面切换到代码页时,把HTML处理成XHTML<br />
EnableXHTML=true/false 是否允许使用XHTML取代HTML<br />
FillEmptyBlocks=true/false 使用这个功能,可以将空的块级元素用空格来替代<br />
FontColors="" 设置显示颜色拾取器时文字颜色列表<br />
FontFormats="" 设置显示在文字格式列表中的命名<br />
FontNames="" 字体列表中的字体名<br />
FontSizes="" 字体大小中的字号列表<br />
ForcePasteAsPlainText=true/false 强制粘贴为纯文本<br />
ForceSimpleAmpersand=true/false 是否不把&符号转换为XML实体<br />
FormatIndentator="" 当在源码格式下缩进代码使用的字符<br />
FormatOutput=true/false 当输出内容时是否自动格式化代码<br />
FormatSource=true/false 在切换到代码视图时是否自动格式化代码<br />
FullPage=true/false 是否允许编辑整个HTML文件,还是仅允许编辑BODY间的内容<br />
GeckoUseSPAN=true/false 是否允许SPAN标记代替B,I,U标记<br />
IeSpellDownloadUrl=""下载拼写检查器的网址<br />
ImageBrowser=true/false 是否允许浏览服务器功能<br />
ImageBrowserURL="" 浏览服务器时运行的URL<br />
ImageBrowserWindowHeight="" 图像浏览器窗口高度<br />
ImageBrowserWindowWidth="" 图像浏览器窗口宽度<br />
LinkBrowser=true/false 是否允许在插入链接时浏览服务器<br />
LinkBrowserURL="" 插入链接时浏览服务器的URL<br />
LinkBrowserWindowHeight=""链接目标浏览器窗口高度<br />
LinkBrowserWindowWidth=""链接目标浏览器窗口宽度<br />
Plugins=object 注册插件<br />
PluginsPath="" 插件文件夹<br />
ShowBorders=true/false 合并边框<br />
SkinPath="" 皮肤文件夹位置<br />
SmileyColumns=12 图符窗列数<br />
SmileyImages=字符数组 图符窗中图片文件名数组<br />
SmileyPath="" 图符文件夹路径<br />
SmileyWindowHeight 图符窗口高度<br />
SmileyWindowWidth 图符窗口宽度<br />
SpellChecker="ieSpell/Spellerpages" 设置拼写检查器<br />
StartupFocus=true/false 开启时FOCUS到编辑器<br />
StylesXmlPath="" 设置定义CSS样式列表的XML文件的位置<br />
TabSpaces=4 TAB键产生的空格字符数<br />
ToolBarCanCollapse=true/false 是否允许展开/折叠工具栏<br />
ToolbarSets=object 允许使用TOOLBAR集合<br />
ToolbarStartExpanded=true/false 开启是TOOLBAR是否展开<br />
UseBROnCarriageReturn=true/false 当回车时是产生BR标记还是P或者DIV标记</p>
<p>如何自定义样式列表呢?<br />
FCKEDITOR的样式工具栏中提供了预定义的样式,样式是通过XML文件定义的,默认的XML样式文件存在于FCkEditor根文件夹下的FckStyls.xml文件中<br />
这个XML文件的结构分析如下:<br />
<?xml version="1.0" encoding="utf-8" ?></p>
<styles ></p>
<style name="My Image" element="img">
<attribute name="style" value="padding: 5px" /><br />
<attribute name="border" value="2" /><br />
</style ></p>
<style name="Italic" element="em" /></p>
<style name="Title" element="span">
<attribute name="class" value="Title" /><br />
</style ></p>
<style name="Title H3" element="h3" />
</styles>
<p>每一个STYLE标记定义一种样式,NAME是显示在下拉列表中的样式名,ELEMENT属性指定此样式所适用的对象,因为FCKEDITOR中的样式是上下文敏感的,也就是说,选择不同的对象,仅会显示针对这类对象定义的样式</p>
<p>拼写检查</p>
<p>FCKEDITOR带了两种拼写检查工具,一种是ieSpell,默认情况下使用这种,使用这种方式的拼写检查,要求客户下载并安装iespell这个小软件,另外,也提供SpellPager的方式来进行拼写检查,不过,由于SPELLPAGER是由PHP编写的服务器端脚本,因此,要求你的WEB服务器必须支持PHP脚本语言方可<br />
更改拼写检查器的方式请参见有关配置文件的详细说明</p>
<p>压缩脚本</p>
<p>为了提供脚本载入的效率,FCKEDITOR采用以下方法对脚本尽量压缩以减少脚本尺寸:<br />
1,移除掉脚本中的注释<br />
2.移除掉脚本中所有无意义的空白<br />
另外,FCKEDITOR还提供了一个专门用于压缩脚本的工具以便 你在发布时能减小文件尺寸,<br />
你可以将_Packager文件夹中的Fckeditor.Packager.exe复制到FCKEDITOR根文件夹来运行并压缩脚本</p>
<p>本地化FCKEDITOR<br />
如果FCKEDITOR没有提供您所需要的语言(实际上全有了),你也可以自行制作新的语言<br />
,你只需要复制出EN.JS,然后在其基础上进行翻译.另外,语言名称与对应的脚本文件名必须遵循RFC 3066标准,但是,需要小写,例如:Portuguess Language对应的脚本文件名必须为pt.js<br />
如果需要针对某个国家的某种语系,则可以在语系缩写后加上横线及国家缩写即可</p>
<p>在使用时,系统会自动侦测客户端语系及国别而运用适当的界面语言.</p>
<p>当建立一种新的语言后,你必须在"Edit/lang/fcklanguagemanager.js"中为其建立一个条目,如下所示:<br />
FCKLanguageManager.AvailableLanguages = <br />
{</p>
<p>en : 'English',<br />
pt : 'Portuguese' <br />
} </p>
<p>需要提醒的是,文件必须保存为UTF-8格式</p>
<p>如何与服务器端脚本进行交互?<br />
请查看例子以得到相关内容</p>
<p>另外,在ASP.NET中以以下步骤使用<br />
1.把FCKEDITOR添中到工具箱<br />
2.托拽FCKEDITOR控件到页面<br />
3.为其指定名称<br />
4.FCKEDITOR类的所有属性不光可以在代码中使用,而且可以作为FCKEDITOR控件的属性直接使用,例如,要改变皮肤,可以在UI页面中指定SkinPath="/fckeditor/editor/skins/office2003"即可,其实FCKEDITOR的ASP.NET版本可以做得更好,你可以找到FCKEDITOR ASP.NET 2.1的源文件,然后修改该控件的设计,为其暴露更多有用的属性,重新编译即可<br />
5,POSTBACK后的数据,使用FCKEDITOR控件的value属性获得<br />
6.由于默认状态下,ASP.NET不允许提交含有HTML及JAVASCRIPT的内容,因此,你必须将使用FCKEDITOR的页面的ValidateRequest设为false.(<%@page validteRequest="false" %>即可)</p>
<p>--------------------------------------------------------
附：

一、如何设置上传文件语言

把FCKeditor根目录下面的fckconfig.js文件里

var \_FileBrowserLanguage

