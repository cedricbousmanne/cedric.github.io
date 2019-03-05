---
id: 786
title: Charger des applications automatiquement au démarrage
date: 2006-02-02 18:11:14.000000000 +00:00
author: cedric
layout: post

guid: http://localhost:4000/2006/02/02/charger-des-applications-automatiquement-au-demarrage.html
permalink: "/2006/02/02/charger-des-applications-automatiquement-au-demarrage/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '574'
categories:
- Non classé
---
Dans certains cas, comme pour Gdesklets, par exemple, il est interressant de pouvoir charger une application au démarrage de Debian.

Cela se fait simplement, par le menu :

<code class="highlighter-rouge">Bureau > Préférences > Sessions > Programmes au démarrage > Ajouter</code>

Dans la zone de saisie _Commande de démarrage_, entrez la commande de lancement du programme, par exemple :

<code class="highlighter-rouge">gdesklets</code>