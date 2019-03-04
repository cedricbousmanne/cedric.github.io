---
id: 793
title: Trouver tout les fichiers de plus de X Mo
date: 2006-01-21 00:25:16.000000000 +00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/01/21/trouver-tout-les-fichiers-de-plus-de-x-mo.html
permalink: "/2006/01/21/trouver-tout-les-fichiers-de-plus-de-x-mo/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '567'
categories:
- Non classé
---
<code class="highlighter-rouge">find DOSSIER -type f -size +X0000000c -ls</code>

Par exemple, pour lister tout les fichiers du dossier /var qui font plus de 3Mo :

<code class="highlighter-rouge">find /var -type f -size +30000000c -ls</code>