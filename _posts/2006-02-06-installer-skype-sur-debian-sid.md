---
id: 785
title: Installer Skype sur Debian SiD
date: 2006-02-06T10:13:43+00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/02/06/installer-skype-sur-debian-sid.html
permalink: /2006/02/06/installer-skype-sur-debian-sid/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "575"
categories:
  - Non classé
---
Skype est un logiciel de Voice Over IP (VOIP), permettant donc de converser par la voix avec ses contacts.

Ce logiciel n’est **pas libre**, mais il existe un paquet debian maintenu par les développeurs de Skype. Si vous souhaitez un logiciel VOIP libre, je vous suggère donc de vous tourner vers _Gizmo-Projet_, par exemple.

L’installation de skype passe inévitablement par le dieu _apt-get_, cependant, le paquet n’est pas officiellement soutenu par Debian, il faut donc aller ajouter un dépôt dans la source.list :

<code class="highlighter-rouge">vim /etc/apt/source.list</code>

Et y ajouter la ligne :

<code class="highlighter-rouge">deb http://download.skype.com/linux/repos/debian/ stable non-free</code>

Puis mettez à jour :

<code class="highlighter-rouge">apt-get update</code>

L’utilisation de Skype nécéssite la librairie libqt3c102-mt (>= 3:3.3.3.2). Si cette dernière n’est pas déjà installée, ré-éditez le fichier des dépôts pour ajouter la ligne :

<code class="highlighter-rouge">deb http://www.debian-desktop.org/pub/linux/debian/kde-3.4.3 sarge main</code>

Puis mettez à jour :

<code class="highlighter-rouge">apt-get update</code>

Installer Skype :

<code class="highlighter-rouge">apt-get update Skype</code>

La librairie \_libqt \_sera automatiquement installée si nécessaire.