---
id: 632
title: Backup du dossier utilisateur
date: 2007-06-19 21:19:51.000000000 +00:00
author: cedric
layout: post

guid: http://localhost:4000/2007/06/19/backup-du-dossier-utilisateur.html
permalink: "/2007/06/19/backup-du-dossier-utilisateur/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '728'
categories:
- Non classé
---
Petite note personnelle : Des backups de tes fichiers, régulièrement tu feras.

<code class="highlighter-rouge">tar cvpfz backup-YYYY-MM-DD.tgz /home/akyrho/ --exclude=/home/akyrho/DivX --exclude=/home/akyrho/temp/ --exclude=/home/akyrho/.Trash --exclude=/home/akyrho/backup-YYYY-MM-DD.tgz --exclude=/home/akyrho/Jeux --exclude=/home/akyrho/photos&lt;br />
</code>

Explications sur [D Ramc’s Blog](http://blog.dramces.com/dotclear/index.php/2006/09/30/52-archivez-archivez) via [szdavid](http://www.szdavid.com/wordpress/2007/06/16/a-quelque-chose-malheur-est-bon/).

[tags]Linux, Ubuntu, Astuces[/tags]