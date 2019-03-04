---
id: 781
title: Skype et KDE sur Debian SiD
date: 2006-03-13 18:56:40.000000000 +00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/03/13/skype-et-kde-sur-debian-sid.html
permalink: "/2006/03/13/skype-et-kde-sur-debian-sid/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '579'
categories:
- Non classé
---
J’ai rencontré le problème suivant :

> skype:
> 
> Dépend : libqt3c102-mt mais ne doit pas être installé  
> >  
> > 

Et en tentant d’installer manuellement la librairie libqt3c102-mt, synaptic voulait désinstaller l’ensemble des paquets dépendants de KDE.

J’ai donc temporairement trouvé la solution suivante : installer le paquet <code class="highlighter-rouge">skype-static</code> en lieu et place du paquet <code class="highlighter-rouge">skype</code>.