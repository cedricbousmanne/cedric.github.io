---
id: 789
title: Mon serveur FTP ne répond plus
date: 2006-02-01T15:37:01+00:00
author: cedric
layout: post
guid: http://localhost:4000/2006/02/01/mon-serveur-ftp-ne-repond-plus.html
permalink: /2006/02/01/mon-serveur-ftp-ne-repond-plus/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "571"
categories:
  - Non classé
---
## Problème {#problème}

<code class="highlighter-rouge">localhost.localdomain - Failed binding to 0.0.0.0, port 21: Address already in use</code>

## Solution {#solution}

<code class="highlighter-rouge">netstat -anop | grep "21"</code>

Dans mon cas, la ligne retournée qui m’interessait était celle-ci :

<code class="highlighter-rouge">tcp        0      0 0.0.0.0:21              0.0.0.0:*               LISTEN     990/inetd           off (0.00/0/0)</code>

En effet, pour une raison inconnue, inetd utilise le port 21 du serveur, habituellement réservé au FTP. Dans mon cas, la seule solution (un peu bourrin, j’avoue) fut d’arrêter inetd, relancer proftpd, puis redémarrer inetd :

\`aveeva:~# /etc/init.d/inetd stop

Stopping internet superserver: inetd.

aveeva:~# /etc/init.d/proftpd start

Starting ProFTPD ftp daemon: proftpd.

aveeva:~# /etc/init.d/inetd start

Starting internet superserver: inetd.

\`