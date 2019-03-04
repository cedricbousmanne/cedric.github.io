---
id: 4267
title: 'I Need A Budget &#8211; Using YNAB with belgian bank accounts'
date: 2018-11-02T12:53:57+00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4267
permalink: /2018/11/02/i-need-a-budget-using-ynab-with-belgian-bank-accounts/
snap_isAutoPosted:
  - "1541159637"
mf2_mp-syndicate-to:
  - 'a:1:{i:0;s:22:"bridgy-publish_twitter";}'
mastoshare-post-status:
  - 'off'
mastoshareshare-lastSuccessfullTootURL:
  - https://ruby.social/@akyrho/101001438136657141
mf2_syndication:
  - 'a:2:{i:0;s:46:"https://ruby.social/@akyrho/101001438136657141";i:1;s:53:"https://twitter.com/akyrho/status/1058326435956473857";}'
geo_weather:
  - 'a:2:{s:5:"units";s:1:"C";s:4:"icon";s:4:"none";}'
geo_public:
  - "0"
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
  - Non classé
tags:
  - personal finance
  - psd2
  - xs2a
  - ynab
kind:
  - Note
---
I recently discovered that budgeting might not be as boring as I thought. Better yet, budgeting might help me achieve my goals in life.

The problem is in this pre-[PSD2](https://en.wikipedia.org/wiki/Payment_Services_Directive#Revised_Directive_on_Payment_Services_(PSD2))/XS2A world, syncing my bank accounts with [YNAB](https://www.youneedabudget.com/) is a real pain and I tried to automate the process to the best that I could.

Current workflow :

  * Downloading my accounts statements in CSV from by bank (BNP Paribas Fortis) (manual &#8211; i tried to automate this step with [iMacros for Firefox](https://addons.mozilla.org/fr/firefox/addon/imacros-for-firefox/?src=search), but failed)
  * Parsing the CSV and converting it to a valid OFX file via <https://csvconverter.biz/> (semi-manual, but at least i&rsquo;ve got the file just right)
  * Import each file to YNAB through drag&rsquo;n&rsquo;drop (manual, but easy)

I started using YNAB only a week ago, I&rsquo;ll probably have a lot more to say about it in the next few months.