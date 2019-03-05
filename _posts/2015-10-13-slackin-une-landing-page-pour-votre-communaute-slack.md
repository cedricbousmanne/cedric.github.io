---
id: 13
title: 'Slackin : une landing page pour votre communauté Slack'
date: 2015-10-13 09:04:16.000000000 +00:00
author: cedric
layout: post


guid: https://cedric.io/2015/10/13/slackin-landing-page-communaute-slack.html
permalink: "/2015/10/13/slackin-une-landing-page-pour-votre-communaute-slack/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '273'
categories:
- Non classé
---
Aujourd’hui, nous avons décidés de lancer [une communauté Slack](http://slack.6x7asbl.be) pour l’[ASBL 6&#215;7](http://www.6x7asbl.be). Si vous ne le savez pas encore, [Slack](http://slack.com) est un outil de communication collaboratif qui a le vent en poupe.

Le problème, c’est bien évidemment de gérer les invitations. En effet, par défaut, Slack ne permet qu’aux administrateurs du compte d’inviter d’autres membres. Hors, nous souhaitions que les membres potentiels se manifestent d’eux même pour faciliter le processus.

Bien sûr, nous aurions pu mettre en place un [Google Form](https://www.google.com/intl/fr_be/forms/about/) relié à une adresse e-mail, mais le processus n’en aurait pas été plus automatisé.

En farfouillant sur GitHub, je suis tombé sur [Slackin](https://github.com/rauchg/slackin), qui permet de gérer ça de manière automatique, et qui offre même un petit badge à afficher sur n’importe quelle page web :

![Slackin](/images/slackin-demo.gif) 

## NodeJS {#nodejs}

Slackin est un module [NodeJS](nodejs.org), nous devons donc commencer par le faire tourner sur la machine qui hébergera le service :

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>&lt;span class="nb">cd&lt;/span> /tmp/
&lt;span class="nv">$ &lt;/span>wget node-v4.1.2.tar.gz
&lt;span class="nv">$ &lt;/span>wget https://nodejs.org/dist/v4.1.2/node-v4.1.2.tar.gz
&lt;span class="nv">$ &lt;/span>&lt;span class="nb">tar&lt;/span> &lt;span class="nt">-zxvf&lt;/span> node-v4.1.2.tar.gz
&lt;span class="nv">$ &lt;/span>&lt;span class="nb">cd &lt;/span>node-v4.1.2
&lt;span class="nv">$ &lt;/span>./configure
&lt;span class="nv">$ &lt;/span>make
&lt;span class="nv">$ &lt;/span>&lt;span class="nb">sudo &lt;/span>make install
</code></pre>
  </div>
</div>

Passons à l’installation de [npm](https://www.npmjs.com/) et du package slackin :

<!-- more -->

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>&lt;span class="nb">sudo &lt;/span>apt-get install npm
&lt;span class="nv">$ &lt;/span>npm install &lt;span class="nt">-g&lt;/span> slackin
</code></pre>
  </div>
</div>

Et pour terminer, on démarre le processus pour faire un premier essais :

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>slackin &lt;span class="o">[&lt;/span>votre-sous-domaine-slack] &lt;span class="o">[&lt;/span>api-token-slack]
</code></pre>
  </div>
</div>

  * Remplacez <code class="highlighter-rouge">[votre-sous-domaine-slack]</code> par la bonne valeur, dans notre cas : 6x7asbl
  * Remplacez <code class="highlighter-rouge">[api-token-slack]</code> par une clé API valide. Trouvez la vôtre [**ici**](https://api.slack.com/web).
  * Pour quitter le processus, faites <code class="highlighter-rouge">ctrl+c</code>

Par défaut, le port utilisé est le <code class="highlighter-rouge">:3000</code>, on peut donc ouvrir notre navigateur sur <code class="highlighter-rouge">ip.du.serveur:3000</code> et y découvrir l’interface de Slackin :

![6x7 asbl Slack Community Landing Page](/images/6x7asbl-slack-community.jpg) 

## Créer le serveur node {#créer-le-serveur-node}

Jusque ici, tout fonctionne pour le mieux dans le meilleur des mondes. Mais l’idéal serait de créer un daemon pour controller le démarrage et l’arrêt du processus. On pourra également gérer le démarrage au reboot ou encore le monitorer.

Pour ce faire, nous allons créer un serveur Node.js qui lancera Slackin en tant que module. Le serveur écoutera, comme la commande utilisée précédemment, sur le port <code class="highlighter-rouge">3000</code>.

On crée un fichier <code class="highlighter-rouge">/var/www/slackin/server.js</code> :

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>touch /var/www/slackin/server.js
</code></pre>
  </div>
</div>

<div class="language-js highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nx">require&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s1">'slackin'&lt;/span>&lt;span class="p">)({&lt;/span>
  &lt;span class="na">token&lt;/span>&lt;span class="p">:&lt;/span> &lt;span class="s1">'[api-token-slack]'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="c1">// required&lt;/span>
  &lt;span class="na">interval&lt;/span>&lt;span class="p">:&lt;/span> &lt;span class="mi">1000&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="na">org&lt;/span>&lt;span class="p">:&lt;/span> &lt;span class="s1">'[votre-sous-domaine-slack]'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="c1">// required&lt;/span>
  &lt;span class="c1">//channels: 'channel,channel,...' // for single channel mode&lt;/span>
  &lt;span class="na">silent&lt;/span>&lt;span class="p">:&lt;/span> &lt;span class="kc">false&lt;/span> &lt;span class="c1">// suppresses warnings&lt;/span>
&lt;span class="p">}).&lt;/span>&lt;span class="nx">listen&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="mi">3000&lt;/span>&lt;span class="p">);&lt;/span>
</code></pre>
  </div>
</div>

Comme précédemment, il faut remplacer les valeurs de <code class="highlighter-rouge">token</code> et <code class="highlighter-rouge">org</code> par nos propres valeurs :

  * Remplacez <code class="highlighter-rouge">[votre-sous-domaine-slack]</code> par la bonne valeur, dans notre cas : 6x7asbl
  * Remplacez <code class="highlighter-rouge">[api-token-slack]</code> par une clé API valide. Trouvez la vôtre [**ici**](https://api.slack.com/web).

Une fois le fichier sauvegardé, on peut passer à l’étape suivante, la configuration du serveur web.

## Configuration de Nginx {#configuration-de-nginx}

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>server{
  listen 80;
  server_name slack.6x7asbl.be;
  location / {
    proxy_set_header  X-Real-IP   $remote_addr;
    proxy_set_header  Host        $http_host;
    proxy_pass        http://127.0.0.1:3000;
  }
}
</code></pre>
  </div>
</div>

La configuration est assez simple à comprendre : Nginx écoutera sur le port <code class="highlighter-rouge">80</code> pour le domaine <code class="highlighter-rouge">slack.6x7asbl.be</code> et renverra les requêtes sur la machine locale (<code class="highlighter-rouge">127.0.0.1</code>) sur le port <code class="highlighter-rouge">3000</code>, celui là même que nous avons choisi précédemment dans notre application NodeJS.

Une fois le fichier sauvegardé, nous l’activons en créant un lien symbolique du depuis le dossier <code class="highlighter-rouge">sites-available</code> vers le dossier <code class="highlighter-rouge">sites-enabled</code> :

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>&lt;span class="nb">sudo &lt;/span>ln &lt;span class="nt">-s&lt;/span> /etc/nginx/sites-available/slack.6x7asbl.be /etc/nginx/sites-enabled/
</code></pre>
  </div>
</div>

On vérifie que la configuration est correcte :

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>&lt;span class="nb">sudo&lt;/span> /usr/sbin/nginx &lt;span class="nt">-t&lt;/span>
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf &lt;span class="nb">test &lt;/span>is successful
</code></pre>
  </div>
</div>

Et on relance le service <code class="highlighter-rouge">nginx</code> :

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>&lt;span class="nb">sudo&lt;/span> /etc/init.d/nginx restart
</code></pre>
  </div>
</div>

## Configuration de upstart {#configuration-de-upstart}

Pour pouvoir utiliser <code class="highlighter-rouge">upstart</code>, nous créons un nouveau fichier de configuration : <code class="highlighter-rouge">/etc/init/slack6x7asblbe.conf</code>.

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>description &lt;span class="s2">"node.js server for slack.6x7asbl.be"&lt;/span>
author      &lt;span class="s2">"akyrho - http://cedric.io"&lt;/span>

&lt;span class="c"># used to be: start on startup&lt;/span>
&lt;span class="c"># until we found some mounts weren't ready yet while booting:&lt;/span>
start on started mountall
stop on shutdown

&lt;span class="c"># Automatically Respawn:&lt;/span>
respawn
respawn limit 99 5

script
    &lt;span class="c"># Not sure why $HOME is needed, but we found that it is:&lt;/span>
    &lt;span class="nb">export &lt;/span>&lt;span class="nv">HOME&lt;/span>&lt;span class="o">=&lt;/span>&lt;span class="s2">"/home/deploy"&lt;/span>

    &lt;span class="nb">exec&lt;/span> /usr/local/bin/node /var/www/slackin/server.js &lt;span class="o">>>&lt;/span> /var/log/slack.6x7asbl.be.log 2>&1
end script

post-start script
   &lt;span class="c"># Optionally put a script here that will notifiy you node has (re)started&lt;/span>
   &lt;span class="c"># /root/bin/hoptoad.sh "node.js has started!"&lt;/span>
end script
</code></pre>
  </div>
</div>

Attention :

  * N’oubliez pas de personnaliser la valeur de <code class="highlighter-rouge">HOME</code> à la ligne <code class="highlighter-rouge">15</code>
  * A la ligne <code class="highlighter-rouge">17</code>, vérifiez bien les différents path
  * Le nom du fichier détermine le nom de la commande <code class="highlighter-rouge">upstart</code>, dans notre cas, il s’agit de <code class="highlighter-rouge">slack6x7asblbe</code>

Il ne reste plus qu’a lancer le service :

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>start slack6x7asblbe
slack6x7asblbe start/running, process 31541
</code></pre>
  </div>
</div>

Pour arrêter le processus :

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>stop slack6x7asblbe
slack6x7asblbe stop/waiting
</code></pre>
  </div>
</div>