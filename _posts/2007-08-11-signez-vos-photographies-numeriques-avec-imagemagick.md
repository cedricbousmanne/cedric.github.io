---
id: 608
title: Signez vos photographies numériques avec ImageMagick
date: 2007-08-11T13:51:48+00:00
author: cedric
layout: post
guid: https://cedric.io/2007/08/11/signez-vos-photographies-numeriques-avec-imagemagick.html
permalink: /2007/08/11/signez-vos-photographies-numeriques-avec-imagemagick/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "752"
categories:
  - Non classé
---
Si vous voulez éviter de vous faire dérober vos photographies publiées sur Internet, il peut être intéressant d’y apposer votre signature. Pour ce faire, nous allons voir deux méthodes permettant de signer vos compositions : la première en y ajoutant un texte, et la seconde en superposant une image par dessus votre photo. Pour terminer, nous verrons comment réaliser un script et l’intégrer à Nautilus pour automatiser cette manœuvre.

### Avant-propos {#avant-propos}

Pour ce tutorial, nous utiliserons le logiciel [ImageMagick](http://fr.wikipedia.org/wiki/ImageMagick), qui permet de manipuler des images en [ligne de commande](http://fr.wikipedia.org/wiki/Ligne_de_commande).

  * le fichier **original.jpg** représente la photographie originale sur laquelle nous travaillerons;

  * le fichier **signature.png** (pour la deuxième méthode) représente le fichier signature que vous aurez crée;

  * le fichier **resultat.jpg** représente le fichier final crée par ImageMagick.

### Ajouter un texte par dessus votre photographie {#ajouter-un-texte-par-dessus-votre-photographie}

Cette méthode est la plus simple : ajouter un texte (votre copyright, votre nom, l’URL de votre site) par dessus la photographie.

<code class="highlighter-rouge">convert original.jpg -append -gravity SouthEast -font DejaVuSans.ttf -pointsize 15 -fill white -draw "text 10,0 'copyright (parenthèse.be)'" resultat.jpg</code>

![Fichier signé avec un texte](/images/2007/08/320x-resultat-texte.jpg) 

  * l’argument **-gravity southeast** place la signature dans le coin sud-est (en bas à droite) de l’image; cet argument comprend également les valeurs suivantes :
    
      * _northwest_ (en haut à gauche)
    
      * _north_ (en haut, centré)
    
      * _northeast_ (en haut à droite)
    
      * _center_ (centre absolu)
    
      * _southwest_ (en bas à gauche)
    
      * _south_ (en bas, centré)
    
      * _southeast_ (en bas à droite)

  * L’argument **-font** permet de définir la police à utiliser. **Attention**, il doit s’agir du chemin complet du fichier ttf. Ici, le fichier _DejaVuSans.ttf_ à été copié dans le répertoire de test.

  * L’argument **-pointsize** permet de définir la taille du texte

  * L’argument **-fill** permet de définir la couleur du texte

### Ajouter une image par dessus votre photographie {#ajouter-une-image-par-dessus-votre-photographie}

Si la première solution vous parait trop simpliste, ou que vous voulez ajouter autre chose que du texte (par exemple, votre logo), il faut alors réussir à surexposer deux images.

<code class="highlighter-rouge">composite -dissolve 100 signature.png -gravity southeast original.jpg resultat.jpg</code>

![Fichier signé avec une image](/images/2007/08/320x-resultat-image.jpg) 

  * l’argument **-dissolve** permet de préciser l’opacité de la signature (ici, le maximum)

  * l’argument **-gravity southeast** place la signature dans le coin sud-est (en bas à droite) de l’image; cet argument comprend également les valeurs suivantes :
    
      * _northwest_ (en haut à gauche)
    
      * _north_ (en haut, centré)
    
      * _northeast_ (en haut à droite)
    
      * _center_ (centre absolu)
    
      * _southwest_ (en bas à gauche)
    
      * _south_ (en bas, centré)
    
      * _southeast_ (en bas à droite)

### Réaliser un script sous Gnome {#réaliser-un-script-sous-gnome}

Pour réaliser un script accessible via le menu de Nautilus, nous allons ouvrir un nouveau document texte et ajouter quelques éléments à notre commande :  
\`  
#!/bin/sh

# script de signature de photo par AkyRhO (parenthese.be) {#script-de-signature-de-photo-par-akyrho-parenthesebe}

while [ $# -gt 0 ]; do  
picture=$1  
composite -dissolve 100 ~/.gnome2/nautilus-scripts/signature.png -geometry +41+10 -gravity southeast “$picture” s_“$picture”  
shift  
done\`

  * Enregistrez le fichier sous <code class="highlighter-rouge">~/.gnome2/nautilius-scripts/Signer la photo</code>

[nice_info]Pour vous rendre dans un dossier caché sous Nautilus, ouvrez votre navigateur et utiliser la combinaison <code class="highlighter-rouge">Ctrl+L</code> pour entrer manuellement le chemin à atteindre[/nice_info]

  * Donnez lui les droits en exécution (_clic droit > propriétés > onglet “permissions” > autoriser l’exécution du fichier comme un programme_)

  * Copier votre fichier signature.png dans le dossier <code class="highlighter-rouge">~/.gnome2/nautilius-scripts/</code>

  * Votre script est prêt à l’emploi! Désormais, dans n’importe quel dossier et sur n’importe quelle image, sélectionnez _clic droit > scripts > Signer la photo_ et une copie signée de votre photographie sera effectuée!

### Conclusion {#conclusion}

ImageMagick est un outil très puissant, malheureusement, il est assez mal documenté sur Internet, mais il n’en reste pas moins que l’outil est très interressant à découvrir. Les possibilités qu’il offre sont infinie et il fera certainement gagner beaucoup de temps à ceux qui manipulent régulièrement des images.