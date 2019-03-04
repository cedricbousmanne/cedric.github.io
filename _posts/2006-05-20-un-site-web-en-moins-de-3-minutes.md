---
id: 749
title: Un site web en moins de 3 minutes
date: 2006-05-20T17:06:48+00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/05/20/un-site-web-en-moins-de-3-minutes.html
permalink: /2006/05/20/un-site-web-en-moins-de-3-minutes/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "611"
categories:
  - Non classé
---
3couleurs vous propose de creer [un site web heberge chez vous en moins de 3 minutes](http://3couleurs.blogspot.com/2006/05/un-site-web-en-moins-de-3-minutes.html).

Fantastique, oui mais, ua ne s’adresse pas aux pauvres petits belges qui ont une IP dynamique sur leurs connexion ADSL. En effet, pour les clients Belgacom Skynet, l’IP est mise a  jour systematiquement toutes les 36 heures.

Probleme? Non monsieur, il suffit d’un petit script [cron](http://fr.wikipedia.org/wiki/Cron/)[1] et d’utiliser un service web de mise a  jour automatique des DNS, comme par exemple [EveryDNS](http://www.everydns.net/).

Voila , a  vous les joies de l’hosting@home

#### Notes {#notes}

[1] Ou, pour les _windowziens_, utiliser [un service en ligne alternatif](http://www.webcron.org/)