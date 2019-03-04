---
id: 4162
title: 'Uncaught ArgumentCountError: Too few arguments to function yarns_reader_new_subscription()'
date: 2018-09-26T09:13:37+00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4162
permalink: /2018/09/26/uncaught-argumentcounterror-too-few-arguments-to-function-yarns_reader_new_subscription/
snap_isAutoPosted:
  - "1539781413"
mf2_mp-syndicate-to:
  - 'a:1:{i:0;s:4:"none";}'
mf2_syndication:
  - 'a:1:{i:0;s:60:"https://github.com/jackjamieson2/yarns-indie-reader/issues/6";}'
geo_weather:
  - 'a:2:{s:5:"units";s:1:"C";s:4:"icon";s:4:"none";}'
geo_public:
  - "1"
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snapMD:
  - |
    s:169:"a:1:{i:0;a:6:{s:2:"do";s:1:"0";s:10:"msgTFormat";s:7:"%TITLE%";s:9:"msgFormat";s:19:"%FULLTEXT%
    
    %URL%";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:4:"doMD";i:0;}}";
snapTW:
  - 's:213:"a:1:{i:0;a:8:{s:2:"do";s:1:"0";s:9:"msgFormat";s:26:"%TITLE%. %EXCERPT% - %URL%";s:8:"attchImg";s:1:"1";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:4:"doTW";i:0;}}";'
categories:
  - issues
kind:
  - Note
---
I just installed this plugin &#8211; while it seemed perfect to me, I ran accros this error trying to add a subscription to your site :

`PHP Fatal error: Uncaught ArgumentCountError: Too few arguments<br />
to function yarns_reader_new_subscription(), 1 passed in<br />
/srv/data/web/vhosts/mysite/htdocs/wp-includes/class-wp-hook.php on line<br />
286 and exactly 4 expected in<br />
/srv/data/web/vhosts/mysite/htdocs/wp-content/plugins/yarns-indie-reader-master/yarns_reader.php:790`

Please let me know if you need more info.