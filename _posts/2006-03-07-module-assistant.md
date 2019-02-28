---
id: 782
title: module-assistant
date: 2006-03-07 16:08:02.000000000 +00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/03/07/module-assistant.html
permalink: "/2006/03/07/module-assistant/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '578'
categories:
- Non classé
---
Compiler ces modules, les installer, etc… Je sais pas vous, mais moi, ça m’énerve. D’aucuns me jetteront la pierre en me gratifiant d’insultes, car il s’agit là d’une des pièce maîtresse de Linux, mais je n’aime pas.

Désolé si certains sont choqués, mais moi, j’aime le simple (comme _apt_) et là, en cherchant sur le Net après m’être cassé la tête avec mes foutus drivers nvidia, je suis tombé sur la perle rare :

<code class="highlighter-rouge">apt-get install module-assistant</code>

Rien de plus simple, alors, que de compiler joyeusement les sources récupérées sur le site officiel :

<code class="highlighter-rouge">m-a auto-install nvidia</code>

Et _module-assistant_ s’occupe du reste ;o)