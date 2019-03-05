---
id: 572
title: WordPress 2.3 et les tags
date: 2007-12-16 17:24:32.000000000 +00:00
author: cedric
layout: post

guid: https://cedric.io/2007/12/16/wordpress-23-et-les-tags.html
permalink: "/2007/12/16/wordpress-2-3-et-les-tags/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '788'
categories:
- Non classé
---
![](/images/images/2.0/wordpress.png)Pour ceux qui, comme moi, l’ignoraient, WordPress intègre, depuis sa version 2.3, un gestionnaire de tags.

Le marqueur a ajouter dans vos templates à été sobrement baptisé the_tags(); et s’utilise comme ceci :

<code class="highlighter-rouge"><?php the_tags('before', 'separator', 'after'); ?></code>

Plus d’information [sur le site de la documentation française de wordpress](http://codex.wordpress.org/fr:Marqueurs_de_Tags/the_tags).