---
id: 4262
title: 'AttributeError: module &lsquo;ofxstatement.plugins.alfabank&rsquo; has no
  attribute &lsquo;AlfabankPlugin&rsquo;'
date: 2018-11-02 09:38:09.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4262
permalink: "/2018/11/02/attributeerror-module-ofxstatement-plugins-alfabank-has-no-attribute-alfabankplugin/"
snap_isAutoPosted:
- '1541147889'
mf2_mp-syndicate-to:
- bridgy-publish_twitter
mastoshare-post-status:
- 'off'
mastoshareshare-lastSuccessfullTootURL:
- https://ruby.social/@akyrho/101000668331608182
snap_MYURL:
- ''
snapEdIT:
- '1'
snapMD: |-
  a:1:{i:0;a:6:{s:2:"do";s:1:"0";s:10:"msgTFormat";s:7:"%TITLE%";s:9:"msgFormat";s:19:"%FULLTEXT%

  %URL%";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:4:"doMD";i:0;}}"
snapTW: a:1:{i:0;a:8:{s:2:"do";s:1:"0";s:9:"msgFormat";s:26:"%TITLE%. %EXCERPT% -
  %URL%";s:8:"attchImg";s:1:"1";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:4:"doTW";i:0;}}
mf2_syndication:
- https://twitter.com/akyrho/status/1058277101265018880
- https://github.com/kedder/ofxstatement/issues/82
geo_weather:
  units: C
  icon: none
geo_public:
- '0'
categories:
- issues
kind:
- Note
---
I just installed ofxstatement to play around with, but i&rsquo;m stuck with this error while running `ofxstatement list-plugins`

<pre>Traceback (most recent call last):
File "/usr/lib/python3/dist-packages/pkg_resources/__init__.py", line 2324, in resolve
return functools.reduce(getattr, self.attrs, module)
AttributeError: module 'ofxstatement.plugins.alfabank' has no attribute 'AlfabankPlugin'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
File "/usr/bin/ofxstatement", line 11, in &lt;module&gt;
load_entry_point('ofxstatement==0.6.1', 'console_scripts', 'ofxstatement')()
File "/usr/lib/python3/dist-packages/ofxstatement/tool.py", line 150, in run
return args.func(args)
File "/usr/lib/python3/dist-packages/ofxstatement/tool.py", line 68, in list_plugins
available_plugins = plugin.list_plugins()
File "/usr/lib/python3/dist-packages/ofxstatement/plugin.py", line 26, in list_plugins
return sorted((ep.name, ep.load()) for ep in plugin_eps)
File "/usr/lib/python3/dist-packages/ofxstatement/plugin.py", line 26, in &lt;genexpr&gt;
return sorted((ep.name, ep.load()) for ep in plugin_eps)
File "/usr/lib/python3/dist-packages/pkg_resources/__init__.py", line 2316, in load
return self.resolve()
File "/usr/lib/python3/dist-packages/pkg_resources/__init__.py", line 2326, in resolve
raise ImportError(str(exc))
ImportError: module 'ofxstatement.plugins.alfabank' has no attribute 'AlfabankPlugin'
</pre>

<pre>$ python --version
Python 2.7.14
</pre>

Please let me know if you need additional information