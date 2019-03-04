---
id: 784
title: Envoyer un mail en ligne de commande
date: 2006-02-22T14:27:15+00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/02/22/envoyer-un-mail-en-ligne-de-commande.html
permalink: /2006/02/22/envoyer-un-mail-en-ligne-de-commande/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "576"
categories:
  - Non classé
---
Pour certaines utilisations (pour tester le serveur, par exemple), il peut être utile de savoir envoyer un courriel directement en ligne de commande. Pour ce faire, voici le gabarit de la commande à utiliser :

<code class="highlighter-rouge">mail user@domain.tld -s sujet</code>

<code class="highlighter-rouge">Ceci est un message</code>

<code class="highlighter-rouge">.</code>

<code class="highlighter-rouge">Cc : </code>

Note : le point seul sur une ligne sert de caractère de fin de mail.