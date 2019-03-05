---
id: 4700
title: QuteBrowser and LastPass
date: 2019-02-08 14:38:33.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4700
permalink: "/2019/02/08/qutebrowser-and-lastpass/"
mf2_mp-syndicate-to:
- bridgy-publish_twitter
geo_weather:
  icon: none
  visibility: public
geo_public:
- '0'
mf2_syndication:
- https://twitter.com/akyrho/status/1093866724758376448
- https://ruby.social/@akyrho/101556755883913000
mastoshare-post-status:
- 'off'
mastoshareshare-lastSuccessfullTootURL:
- https://ruby.social/@akyrho/101556755883913000
categories:
- Non classé
tags:
- cli
- lastpass
- qutebrowser
kind:
- Note
---
I&rsquo;ve been using [QuteBrowser](https://www.qutebrowser.org/) for the past 2 days (more on that later), and the only thing I missed so far was a [LastPass](https://www.lastpass.com/) integration.

Now, QuteBrowser does not come with a plugin store like Firefox or Chrome, but it is still possible to use LastPass with it.

First we need to install `lastpass-cli` and login to the service. I&rsquo;m running Manjaro Linux on my laptop so I use `yaourt` :

<pre>yaourt lasstpass-cli
</pre>

Now we login to Lastpass :

<pre>lpass login &lt;email@domain.tld&gt;
</pre>

A prompt pops-up, asking for your master password. If everything went right, the CLI should responds with

<pre>Success: Logged in as &lt;email@domain.tld&gt;.
</pre>

Since we&rsquo;re good to go, we can now download the QuteBrowser userscripts :

<pre>mkdir -p $/.local/share/qutebrowser/userscripts && cd $_

wget https://raw.githubusercontent.com/welps/qutebrowser/9a85796ac30ef33218dd7dee9db6a3c28364f668/misc/userscripts/qute-lastpass

chmod +x qute-lastpass
</pre>

The script is installed. We can restart QuteBrowser by typing `:restart`.

Now everytime you need to find your login/password for a given page type `:spawn --userscript qute-lastpass`

### Troubleshooting

**Process stderr:  
Traceback (most recent call last):  
File « /home/cedric/.local/share/qutebrowser/userscripts/qute-lastpass », line 50, in <module>  
import tldextract  
ModuleNotFoundError: No module named &lsquo;tldextract&rsquo;**

Solution : `pip install tldextract --user`

**FileNotFoundError: [Errno 2] No such file or directory: &lsquo;lpass&rsquo;: &lsquo;lpass&rsquo;**

Solution : install lastpass-cli

**FileNotFoundError: [Errno 2] No such file or directory: &lsquo;rofi&rsquo;: &lsquo;rofi&rsquo;**

Solution : install [rofi](https://github.com/DaveDavenport/rofi/)