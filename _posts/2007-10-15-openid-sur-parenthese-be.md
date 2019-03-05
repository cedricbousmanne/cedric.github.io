---
id: 602
title: OpenID sur (parenthèse.be)
date: 2007-10-15 07:30:18.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/2007/10/15/openid-sur-parenthesebe.html
permalink: "/2007/10/15/openid-sur-parenthese-be/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '758'
categories:
- Non classé
---
Depuis dimanche après-midi, il est possible de s’authentifier via [OpenID](http://fr.wikipedia.org/wiki/openID) pour poster des commentaires sur ce blog.

### Comment faire? {#comment-faire}

Il suffit d’uploader et d’activer le plugin [OpenID Registration](http://sourceforge.net/projects/wpopenid/) sur votre blog sous WordPress.

Si comme moi, l’url de WordPress est différente de l’adresse du blog, il faudra modifier le script à la ligne 473 :

<code class="highlighter-rouge">$return_to = get_bloginfo('url') . "/wp-login.php?action=$action";</code>

et le remplacer par :

<code class="highlighter-rouge">$return_to = get_bloginfo('url') . "/wordpress/wp-login.php?action=$action";</code>