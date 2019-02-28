---
id: 635
title: Problème d’installation de plugin sous Firefox
date: 2007-06-14 19:59:09.000000000 +00:00
author: cedric
layout: post
guid: http://localhost:4000/2007/06/14/probleme-dinstallation-de-plugin-sous-firefox.html
permalink: "/2007/06/14/probleme-dinstallation-de-plugin-sous-firefox/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '725'
categories:
- Non classé
---
J’ai eu un petit soucis avec l’installation des plugins sous Firefox. Lorsque je cliquais sur le liens pour installer une extension, Firefox ne l’installait pas automatiquement, mais me proposait de télécharger le fichier XPI.

La solution est simple; il suffit en fait de **copier le fichier XPI dans votre répertoire utilisateur**, et Firefox l’installera automatiquement au prochain démarrage.

Exemple sous linux : <code class="highlighter-rouge">mv monextension.xpi ~/.mozilla/firefox/ln2c8b8y.default/extensions/</code>