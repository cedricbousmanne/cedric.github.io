---
id: 741
title: De l’accessibilité du blog
date: 2006-06-06 11:23:07.000000000 +00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/06/06/de-laccessibilite-du-blog.html
permalink: "/2006/06/06/de-laccessibilite-du-blog/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '619'
categories:
- Non classé
---
[Méléis](http://meleis.yi.org/) m’a fait remarquer que certaines gammes de couleurs utilisées sur le blog n’étaient pas accessibles, en m’indiquant un outil très pratique[1] pour remédier au problème. Je me suis donc mis à tenter de rendre _(parenthèse.be)_ plus adapté.

#### Liens de la sidebar {#liens-de-la-sidebar}

Les tons des liens dans la sidebar étaient trop proche de la couleur de fond. Si je voulais les rendre accessible, il me fallait monter beaucoup plus haut dans les foncés (presque noir, vu que le fond est presque blanc). Mais ça ne me plaisait pas : beaucoup trop foncé, j’ai donc décidé d’ajouter l’attribut <code class="highlighter-rouge">a:hover</code> dans ma feuille de style pour changer la couleur au survol de la souris en guise d’alternative.

J’ai fais de même pour les titres des articles.

#### Liens dans le contenu {#liens-dans-le-contenu}

Les autres liens quant à eux, ne pouvaient même pas être vu par certaines personnes, j’ai donc opté pour un brun très foncé, de sorte a bien trancher entre les deux couleurs tout en tenant compte de la relativement petite taille de la police.

Voilà , j’espère que ces modification vous rendront la lecture de ce blog plus agréable, n’hésitez pas si vous avez encore des suggestions!

#### Notes {#notes}

[1] [colourContrastChecker](http://shift.freezope.org/tools_lab/) est un outil pour [Linux](http://fr.wikipedia.org/wiki/Linux) sous licence [GPL](http://fr.wikipedia.org/wiki/Licence_publique_g%C3%A9n%C3%A9rale_GNU) v2