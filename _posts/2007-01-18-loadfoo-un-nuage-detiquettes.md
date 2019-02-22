---
id: 667
title: 'LoadFoo : un nuage d’étiquettes'
date: 2007-01-18T04:01:00+00:00
author: cedric
layout: post
guid: http://localhost:4000/2007/01/18/loadfoo-un-nuage-detiquettes.html
permalink: /2007/01/18/loadfoo-un-nuage-detiquettes/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "693"
categories:
  - Non classé
---
Voici un petit nuage d’étiquette (ou _tag cloud_) pour le thème LoadFoo :![Thème LoadFoo : nuage d'étiquettes](/images/images/LoadFoo-tagcloud.png) Deux manières pour se le procurer :

### Re-télécharger l’archive {#re-télécharger-larchive}

L’archive à été mise à jour et est disponible sur [la page de support du thème LoadFoo pour Dotclear2](/blog/2007/01/14/LoadFoo-pour-DotClear2)

### Modifier le fichier style.css {#modifier-le-fichier-stylecss}

En ajoutant, à la fin du fichier <code class="highlighter-rouge">./themes/LoadFoo2/style.css</code> les lignes suivantes :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code> /* tag cloud */ ul.tags li{ display : inline;list-style-type: none; } ul.tags li a {text-decoration: none;} .tag0,.tag10{color: #868686;} .tag20,.tag30{color: #545454;} .tag0{ font-size: 1.0em; } .tag10{ font-size: 1.2em; } .tag20{ font-size: 1.4em; } .tag30{ font-size: 1.6em; } .tag40{ font-size: 1.8em; } .tag50{ font-size: 1.9em; } .tag60{ font-size: 2.0em; } .tag70{ font-size: 2.1em; } .tag80{ font-size: 2.2em; } .tag90{ font-size: 2.3em; font-weight: bold;} .tag100{ font-size: 2.4em; font-weight: bold;}
</code></pre>
  </div>
</div>