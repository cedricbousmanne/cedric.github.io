---
id: 774
title: Graver une image iso en ligne de commande
date: 2006-03-31T11:33:13+00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/03/31/graver-une-image-iso-en-ligne-de-commande.html
permalink: /2006/03/31/graver-une-image-iso-en-ligne-de-commande/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "586"
categories:
  - Non classé
---
<code class="highlighter-rouge"># cdrecord -v speed=8 dev=0,5,0 /chemin/image.iso</code>

avec :

  * speed la vitesse du graveur 8 pour 8x par exemple,
  * dev l’adresse sur le bus SCSI du graveur, obtenue avec la commande:

 <code class="highlighter-rouge"># cdrecord -scanbus</code>

_Note : si vous avez aussi téléchargé le fichier md5sums (lorsqu’il existe), vous pouvez tester votre image avant de la graver par la commande :_

<code class="highlighter-rouge">$ md5sum -c md5sums</code>

Vu sur Lea-Linux : [Graver une image ISO en ligne de commande](http://lea-linux.org/cached/index/Trucs:Graver_une_image_ISO.html)