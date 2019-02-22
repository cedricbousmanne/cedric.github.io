---
id: 4194
title: How to install Invoice Ninja on a DigitalOcean server with docker
date: 2018-10-25T15:43:47+00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4194
permalink: /2018/10/25/how-to-install-invoiceninja-digitalocean-docker/
mf2_mp-syndicate-to:
  - 'a:1:{i:0;s:22:"bridgy-publish_twitter";}'
mf2_syndication:
  - 'a:2:{i:0;s:53:"https://twitter.com/akyrho/status/1055454968105365504";i:1;s:46:"https://ruby.social/@akyrho/100956571569748191";}'
geo_weather:
  - 'a:2:{s:5:"units";s:1:"C";s:4:"icon";s:4:"none";}'
geo_public:
  - "1"
snap_isAutoPosted:
  - "1540475028"
mastoshare-post-status:
  - 'off'
mastoshareshare-lastSuccessfullTootURL:
  - https://ruby.social/@akyrho/100956571569748191
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
  - web
tags:
  - Docker
kind:
  - Article
---
First, check that your development machine has both docker and docker-machine installed

<pre>which docker</pre>

<pre>which docker-machine</pre>

Create a new droplet on [Digital Ocean](https://m.do.co/c/442ec6e489c9)

<pre>docker-machine create --digitalocean-size "s-1vcpu-1gb" --driver digitalocean --digitalocean-access-token YOUR_DIGITALOCEAN_ACCESS_TOKEN invoiceninja-prod</pre>

Set up the right environment

<pre>eval $(docker-machine env invoiceninja-prod)</pre>

Run the container

<pre>docker run -d -e APP_ENV='production' -e APP_DEBUG=0 -e APP_URL='http://ninja.dev' -e APP_KEY='SomeRandomStringSomeRandomString' -e APP_CIPHER='AES-256-CBC' -e DB_TYPE='mysql' -e DB_STRICT='false' -e DB_HOST='localhost' -e DB_DATABASE='ninja' -e DB_USERNAME='ninja' -e DB_PASSWORD='ninja' -p '80:80' invoiceninja/invoiceninja</pre>

Retrieve your IP

<pre>docker-machine ip invoiceninja-prod</pre>