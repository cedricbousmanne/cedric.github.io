---
id: 4573
title: How to install Rubocop for Sublime Text with rbenv
date: 2019-01-07 16:33:36.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4573
permalink: "/2019/01/07/how-install-rubocop-sublime-text-rbenv/"
mf2_mp-syndicate-to:
- bridgy-publish_twitter
geo_weather:
  icon: none
  visibility: public
mf-syndication:
- https://twitter.com/akyrho/status/1082299255623245826
- https://ruby.social/@akyrho/101376026411767781
mastoshare-post-status:
- 'off'
mastoshareshare-lastSuccessfullTootURL:
- https://ruby.social/@akyrho/101376026411767781
geo_public:
- '0'
categories:
- web
tags:
- rbenv
- rubocop
- ruby
- sublime text
kind:
- Article
---
<a href="https://github.com/rubocop-hq/rubocop" target="_blank" rel="noopener">Rubocop</a> is a static code analyzer and formatter for Ruby. Long story short : it helps you to write better code.

Installing it pretty straight-forward :

> gem install rubocop

Within Sublime Text Control Panel (`CTRL+Shift+P`) :

  1. Find **Package Control: Install Package**
  2. Then **Rubocop** (currently `v2018.12.05.18.01.20`)
  3. Hit `enter`

By default, the ST plugin will look for `rvm`, not `rbenv`. We have to force the settings `Preferences > Package Settings > Rubocop > Settings - Users`, and paste this :

<div class="oembed-gist">
  <noscript>
    View the code on <a href="https://gist.github.com/cedricbousmanne/2c89bf83de175f6fa6fe8dea9b7724b7">Gist</a>.
  </noscript>
</div>

Now we can have a list of the available options by typing `rubocop` withing the Control Panel (`CTRL+Shift+P`).

<img src="https://i1.wp.com/i.imgur.com/RVV9n3B.png?w=900&#038;ssl=1" data-recalc-dims="1" />