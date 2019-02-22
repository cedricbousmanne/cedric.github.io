---
id: 800
title: Modifier le splashscreen de Gnome
date: 2006-01-07T12:28:08+00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/01/07/modifier-le-splashscreen-de-gnome.html
permalink: /2006/01/07/modifier-le-splashscreen-de-gnome/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "560"
categories:
  - Non classé
---
### Définition {#définition}

Le _splashscreen_ est l’écran de démarage de Gnome. (Voir illustration ci-dessous).

### Comment ça se passe? {#comment-ça-se-passe}

#### L’écran par défaut {#lécran-par-défaut}

Par défaut, il faut reconnaître que l’écran de démarrage de Debian n’est pas très joli :

<img src="https://i0.wp.com/img213.imageshack.us/img213/2392/splashdebblue9el.png?w=900" alt="Ecran de démarrage par défaut" data-recalc-dims="1" /> 

#### Modification {#modification}

Commencez par choisir l’écran que vous désirez, par exemple, sur [gnome-look](http://www.gnome-look.org/index.php?xcontentmode=160)

Ensuite, lancer l’application <code class="highlighter-rouge">gnome-splashscreen-manager</code> soit via un shell, soit via le menu d’application > lancer une application.

Si cette dernière n’est pas installé, faite :

<code class="highlighter-rouge">su&lt;br />
apt-get install gnome-splashscreen-manager</code>

Cliquez sur “Install”, puis allez récupérer votre image, là ou vous l’avez stockée (généralement dans votre répertoire utilisateur). Séléctionnez-la, puis cliquez sur “Activate”.