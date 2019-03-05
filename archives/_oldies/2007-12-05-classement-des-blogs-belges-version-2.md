---
id: 581
title: Classement des blogs belges, version 2
date: 2007-12-05 17:04:11.000000000 +00:00
author: cedric
layout: post

guid: https://cedric.io/2007/12/05/classement-des-blogs-belges-version-2.html
permalink: "/2007/12/05/classement-des-blogs-belges-version-2/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '779'
categories:
- Non classé
---
Il y a un peu plus d’un mois, [je vous proposais un classement des blogs belges francophones](/blog/2007/10/28/classement-des-blogs-belges-francophones-selon-feedburner/). Même si ce classement n’a pas eu autant de succès que [celui de Vinch](http://www.vinch.be/blog/2007/09/16/classement-des-blogs-belges-francophones/), on pouvait constater une chose importante : les blogs dont on parle le plus sur Technorati ne sont pas forcément ceux qui ont le plus de lecteurs. En d’autre terme, _c’est pas forcément celui qui a la plus grosse qui pisse le plus loin_.

En partant de ce constat, j’en ai donc conclu qu’aucun de ces deux classements ne permettait vraiment de savoir quels étaient les blogs les plus \_influents\_Beurk, j’aime pas ce mot, et j’ai donc décidé de mettre à jour mon script de classement pour prendre en compte le nombre de liens entrant dans Technorati.

[![Classement des blogs belges au 5 décembre 2007](/images/2007/12/classement.png)](http://www.parenthese.be/topblog)

Concrètement, le script récupère trois données :

  * Le nombre de lecteurs abonnés à FeedBurner;

  * Le nombre d’articles faisant un liens vers l’un des votres;

  * Le nombre de blogs faisant un liens vers le votre.

Une fois ces trois données récupérées, le script en calcule les ratios (votre donnée / la donnée maximale du classement) en pourcent, et en calcule la moyenne.

Pour les inscriptions, [c’est par ici que ça se passe](http://www.parenthese.be/topblog).