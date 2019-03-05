---
id: 794
title: Lire des vidéos wmv sous Linux
date: 2006-01-18 09:56:01.000000000 +00:00
author: cedric
layout: post

guid: http://localhost:4000/2006/01/18/lire-des-videos-wmv-sous-linux.html
permalink: "/2006/01/18/lire-des-videos-wmv-sous-linux/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '566'
categories:
- Non classé
---
Le format wmv est un format propriétaire à Microsoft, c’est pourquoi il n’est pas nativement supporté par _Totem_. Toutefois, une solution existe.

Modifier la liste des dépots apt (vous devez être en _root_ pour effectuer cette opération):

<code class="highlighter-rouge">vim /etc/apt/sources.list</code>

Ajouter, n’importe ou dans la liste :

<code class="highlighter-rouge">deb ftp://ftp.nerim.net/debian-marillat/ etch main</code>

Quittez votre éditeur de texte, et mettez à jour la liste des paquets disponibles :

<code class="highlighter-rouge">apt-get update</code>

Installer le paquet _W32Codecs_ :

<code class="highlighter-rouge">apt-get install w32codecs</code>

Terminé<img src="https://i1.wp.com/debian.ehia.org/wp-includes/images/smilies/icon_wink.gif?w=900" alt=";)" data-recalc-dims="1" />