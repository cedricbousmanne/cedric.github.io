---
id: 682
title: Configuration d’un clavier multimédia sous Linux
date: 2007-01-05 18:30:00.000000000 +00:00
author: cedric
layout: post

guid: http://localhost:4000/2007/01/05/configuration-dun-clavier-multimedia-sous-linux.html
permalink: "/2007/01/05/configuration-dun-clavier-multimedia-sous-linux/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '678'
categories:
- Non classé
---
Sur mon clavier, en plus des touches classique, il y a un pavé multimédia, avec les touches <code class="highlighter-rouge">Media</code>, <code class="highlighter-rouge">Play/Pause</code>, <code class="highlighter-rouge">Mute</code>, <code class="highlighter-rouge">Favorites</code>, <code class="highlighter-rouge">E-Mail</code> et <code class="highlighter-rouge">WWW</code>. Ce genre de raccourcis est très pratique… pourvu qu’ils fonctionnent.

<!-- more -->

### Récupération du code des touches {#récupération-du-code-des-touches}

Pour comprendre comment cela se passe, il faut savoir qu’en appuyant sur une touche du clavier, on envoit un signal à l’ordinateur, et que ce signal se traduit par un code d’identification.

Pour récupérez ce code, ouvrez un terminal, et lancer le programme xev :

<code class="highlighter-rouge">akyrho@akyrho-desktop:~# xev</code>

Une petite fenêtre s’ouvre, placez-y votre souris. Vous remarquerez que chaque mouvement de souris retourne une certaine série de ligne dans le terminal. Une fois prêt (gardez le terminal et xev en vis-à-vis), cliquez sur votre première touche multimédia. Chez moi, il s’agit de la touche <code class="highlighter-rouge">Media</code>

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code> KeyRelease event, serial 29, synthetic NO, window 0x1e00001,     root 0x118, subw 0x0, time 4078267062, (201,233), root:(361,529),     state 0x10, __keycode 237__ (keysym 0x0, NoSymbol), same_screen YES,     XLookupString gives 0 bytes:     XFilterEvent returns: False
</code></pre>
  </div>
</div>

Dans cet exemple, le code d’identification de la touche est 237.

Faites de même pour chacune des touches multimédia de votre clavier.

### Configuration {#configuration}

Pour activer ces touches, il faut leur assigner une fonction. L’ensembe de ces fonction est répertoriée dans le fichier <code class="highlighter-rouge">/usr/X11R6/lib/X11/XKeysymDB</code>[1]. Une fois ces fonctions identifiées, créer un fichier <code class="highlighter-rouge">.xmodmaprc</code> dans le répertoire utilisateur ($HOME).

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code> !Media keycode 237 = XF86AudioMedia !Play/Pause keycode 162 = XF86AudioPause !Favorites keycode 230 = XF86Favorites
</code></pre>
  </div>
</div>

### Sources {#sources}

[http://www.laboiteaprog.com/article-configurer\_son\_clavier\_multimedia\_sous_linux-90-5](http://www.laboiteaprog.com/article-configurer_son_clavier_multimedia_sous_linux-90-5) <http://linuxfr.org/2002/09/24/9748.html> <http://kadreg.free.fr/cla/>

#### Notes {#notes}

[1] Ou, comme chez moi, dans /usr/share/X11/XKeysymDB