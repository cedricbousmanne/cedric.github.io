---
id: 644
title: Petites astuces pour Bash
date: 2007-05-31 15:40:00.000000000 +00:00
author: cedric
layout: post
guid: http://localhost:4000/2007/05/31/petites-astuces-pour-bash.html
permalink: "/2007/05/31/petites-astuces-pour-bash/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '716'
categories:
- Non classé
---
## Colorer votre terminal {#colorer-votre-terminal}

Dans votre fichier <code class="highlighter-rouge">~/.bashrc</code>, commentez les lignes :

<pre><code class="language-ru">  # case "$TERM" in
  #xterm-color)
  #PS1='${debian_chroot:+($debian_chroot)}[33[01;32m]u@h[33[00m]:[33[01;34m]w[33[00m]$'
  #    ;;
  #*)
  #    PS1='${debian_chroot:+($debian_chroot)}u@h:w$ '
  #    ;;
  #esac
</code></pre>

Décommentez celle-ci :

<pre><code class="language-ru">PS1='${debian_chroot:+($debian_chroot)}[33[01;32m]u@h[33[00m]:[33[01;34m]w[33[00m]$ '
</code></pre>

## Autres astuces {#autres-astuces}

En cherchant l’astuce précédente, j’en ai trouvé quelques autres aussi sympathique 😉 :

  * [rendre son terminal plus agréable](http://www.think-underground.com/index.php/post/2006/07/02/300-rendre-son-terminal-bash-plus-agreable)
  * [quelques astuces Bash](http://www.think-underground.com/index.php/post/2005/12/04/126-quelques-astuces-bash)
  * [Hack de la fonction rm](http://www.coder-studio.com/forum2/viewtopic.php?pid=23595)