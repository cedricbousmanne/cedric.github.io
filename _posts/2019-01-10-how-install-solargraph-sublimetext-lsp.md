---
id: 4581
title: How to install Solargraph with Sublime Text LSP
date: 2019-01-10 17:15:36.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4581
permalink: "/2019/01/10/how-install-solargraph-sublimetext-lsp/"
mf2_mp-syndicate-to:
- bridgy-publish_twitter
geo_weather:
  icon: none
  visibility: public
geo_public:
- '0'
mf-syndication:
- https://twitter.com/akyrho/status/1083396989289746433
- https://ruby.social/@akyrho/101393166413829417
mastoshare-post-status:
- 'off'
mastoshareshare-lastSuccessfullTootURL:
- https://ruby.social/@akyrho/101393166413829417
categories:
- web
tags:
- ruby
- solargraph
- sublime text
kind:
- Article
---
Solargraph is a Ruby Language Server. It&rsquo;s meant to add code completion and inline documentation onto IDEs.

We have to install the gem first

> gem install solargraph

Within Sublime Text Control Panel (`CTRL+Shift+P`) :

  1. Find **Package Control: Install Package**
  2. Then **LSP**
  3. Hit `enter`

By default, the ST plugin will look for `rvm`, not `rbenv`. We have to force the settings `Preferences > Package Settings > LSP > Settings`, and paste this :

<div class="oembed-gist">
  <noscript>
    View the code on <a href="https://gist.github.com/cedricbousmanne/099bccef4472912aba61545d0c31d5ec">Gist</a>.
  </noscript>
</div>

Note : you need to adjust the value of the path on **line 8**. You can find the exact installation path of `solargraph` on your system with the following command

> which solargraph

Finally we can enable the server via the Sublime Text Control Panel (`CTRL+Shift+P`)

<img src="https://i0.wp.com/imgur.com/6W7tjXLl.png?w=900&#038;ssl=1" data-recalc-dims="1" />