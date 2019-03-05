---
id: 8
title: Debian 8 Jessie sur un Lenovo T420s
date: 2017-02-14 12:05:40.000000000 +00:00
author: cedric
layout: post

guid: https://cedric.io/2017/02/14/debian-8-jessie-lenovo-t420s.html
permalink: "/2017/02/14/debian-8-jessie-sur-un-lenovo-t420s/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '278'
categories:
- Non classé
---
Il y a un peu moins d’un an, j’ai fais l’acquisition d’un Lenovo T420s de seconde main sur eBay.

Cet achat était motivé par deux facteurs :

  * Mon MacBook Pro (late-2011) commençait à montrer des signes de faiblesse &#8211; il tomba effectivement en rade quelques semaines plus tard, mais Apple prit tout de même en charge le remplacement de la carte mère.
  * Les mises à jours continuelles de <del>OS X</del> macOS poussent le consommateur à changer régulièrement de machine &#8211; les dernières versions du MBP ne permettant même plus un _upgrade_ de la RAM ou même du disque dur.

Rajoutons également l’envie de retravailler sous Linux qui me chatouillait depuis un moment.

## Choix d’une distribution {#choix-dune-distribution}

Ubuntu, qui était ma distribution de choix avant 2011, était définitivement hors circuit. L’_Amazon-gate_ était un choix douteux de la part de Canonical, mais mon principal reproche est le même que pour <del>OS X</del> macOS : d’une release à l’autre, Ubuntu me semble de plus en plus surchargé.

ArchLinux semble être à la mode depuis un certain temps, j’avoue avoir été tenté &#8211; et l’avoir même installé pour le côté ludique. Installer Arch avec mon niveau de connaissance n’était pas un défi insurmontable, le configurer _juste comme il faut_ était une autre affaire. Après plusieurs jours de tentatives, j’ai finalement abandonné mon défi. J’y reviendrai sans doute plus tard.

[ElementaryOS](http://www.elementaryos-fr.org/) a été une découverte intéressante : basée sur Ubuntu, ElementaryOS propose toutefois un environnement de bureau unique &#8211; Pantheon. J’ai joué avec la distributions plusieurs semaines avant d’abandonner. Même si l’initiative est intéressante, elle n’est pas encore prête pour un contexte professionel. L’installation par défaut est complètes, mais plusieurs problèmes lors de mise à jour un peu douteuses ont eu raison de ma motivation.

Pour finir, j’en suis revenu à mes premières amours : une Debian toute simple. La critique habituelle suggère que Debian ne suit pas suffisamment rapidement la mise à jour de ses paquets &#8211; ce point ne m’a jamais gêné dans la mesure ou je préfère un système stable qu’un ensemble de fonctionnalités neuves et hypes mais potentiellement buggées.

## La suite {#la-suite}

J’aurais certainement beaucoup à dire à propos de l’utilisation de Debian comme distro principale sur un laptop. Je listerai donc les articles connexes ci-dessous :

  * [Optimisation de la batterie avec TLP](/blog/2017/02/14/debian-laptop-tlp/)