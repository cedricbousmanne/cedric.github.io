---
id: 562
title: 'ActiveResource EOFError: end of file reached'
date: 2013-07-26 11:10:11.000000000 +00:00
author: cedric
layout: post

guid: https://cedric.io/2013/07/26/activeresources-eoferror-end-of-file-reached.html
permalink: "/2013/07/26/activeresource-eoferror-end-of-file-reached/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '798'
categories:
- Non classé
---
Si vous jouez avec ActiveResources et que vous rencontrez l’erreur <code class="highlighter-rouge">EOFError: end of file reached</code>, il s’agit très probablement d’un problème de préfixe :



En ajoutant un <code class="highlighter-rouge">/</code> au début de <code class="highlighter-rouge">self.prefix</code>, l’erreur devrait disparaître.