---
id: 795
title: Utiliser la fonction mail() avec Skynet
date: 2006-01-17T17:32:21+00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/01/17/utiliser-la-fonction-mail-avec-skynet.html
permalink: /2006/01/17/utiliser-la-fonction-mail-avec-skynet/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "565"
categories:
  - Non classé
---
Skynet bloque le port 25 pour les abonnements ADSL privés, mais une solution pour envoyer des mails, que ça soit via un serveur mail ou la fonction homonyme de PHP existe.

Editer le fichier de configuration de postfix :

\`vim /etc/postfix/main.cf