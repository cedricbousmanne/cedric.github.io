---
id: 744
title: Petit hack de la fonction Ping de DotClear
date: 2006-06-05 11:48:21.000000000 +00:00
author: cedric
layout: post

guid: http://localhost:4000/2006/06/05/petit-hack-de-la-fonction-ping-de-dotclear.html
permalink: "/2006/06/05/petit-hack-de-la-fonction-ping-de-dotclear/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '616'
categories:
- Non classé
---
[Comme je le disais hier](http://www.parenthese.be/dotclear/index.php?2006/06/04/87-httparty), ua me broute pas mal de devoir faire mes pings apres avoir publie un article sur _parenthese_. Du coup, vu que je suis un gros glandeur, j’ai trouve un debut de reponse.

<!-- more -->

L’objectif etait donc de faire tout mes pings d’un seul et unique coup. J’avais donc commence par m’interresser a  la structure du fichier index.php du dossier /ping; et j’avais decide d’en rajouter quelques-uns.

Ah oui monsieur, mais ua prend encore plus de temps qu’avant! Tais-toi donc ignorant!

A la fin du fichier **/ecrire/tools/ping/index.php**, trouver la ligne :

<div class="language-html highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nt">&lt;p>&lt;input&lt;/span> &lt;span class="na">type=&lt;/span>&lt;span class="s">"checkbox"&lt;/span> &lt;span class="na">id=&lt;/span>&lt;span class="s">"'.$k.'"&lt;/span> &lt;span class="na">name=&lt;/span>&lt;span class="s">"ping['.$k.']"&lt;/span> &lt;span class="na">value=&lt;/span>&lt;span class="s">"1"&lt;/span> &lt;span class="nt">/>&lt;/span>.
</code></pre>
  </div>
</div>

Et la remplacer par :

<div class="language-html highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nt">&lt;p>&lt;input&lt;/span> &lt;span class="na">type=&lt;/span>&lt;span class="s">"checkbox"&lt;/span> &lt;span class="na">id=&lt;/span>&lt;span class="s">"'.$k.'"&lt;/span> &lt;span class="na">name=&lt;/span>&lt;span class="s">"ping['.$k.']"&lt;/span> &lt;span class="na">value=&lt;/span>&lt;span class="s">"1"&lt;/span> &lt;span class="na">checked=&lt;/span>&lt;span class="s">"checked"&lt;/span> &lt;span class="nt">/>&lt;/span>.
</code></pre>
  </div>
</div>

C’est tout con, mais fallait y penser!