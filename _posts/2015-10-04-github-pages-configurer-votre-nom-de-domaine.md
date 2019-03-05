---
id: 560
title: 'GitHub pages : Configurer votre nom de domaine'
date: 2015-10-04 11:46:30.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/2015/10/04/github-pages-configurer-votre-nom-de-domaine.html
permalink: "/2015/10/04/github-pages-configurer-votre-nom-de-domaine/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '800'
categories:
- Non classé
---
J’ai récemment migré ce blog sous [Octopress](http://octopress.org/). Je reviendrais plus tard sur les détails de la migration, mais en attendant, voici une petite aide concernant l’utilisation de votre propre nom de domaine lorsque votre site est hébergé sur GitHub Pages.

<!-- more -->

Créer un fichier <code class="highlighter-rouge">source/CNAME</code>

<div class="language-bash highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>touch &lt;span class="nb">source&lt;/span>/CNAME
</code></pre>
  </div>
</div>

Je souhaite héberger ce site sous le domaine <code class="highlighter-rouge">cedric.io</code>, mais je souhaite également que l’url <code class="highlighter-rouge">www.cedric.io</code> redirige vers le TLD. En suivant la [documentation fournie](https://help.github.com/articles/tips-for-configuring-an-a-record-with-your-dns-provider/), je remplis mon fichier comme suis :

<div class="language-text highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>cedric.io
www.cedric.io
</code></pre>
  </div>
</div>

On publie les modifications sur la branche <code class="highlighter-rouge">source</code>

<div class="language-bash highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>git add &lt;span class="nb">source&lt;/span>/CNAME
git commit &lt;span class="nt">-a&lt;/span> &lt;span class="nt">-m&lt;/span> &lt;span class="s2">"Add CNAME file"&lt;/span>
git push
</code></pre>
  </div>
</div>

Et on déploie la nouvelle version

<div class="language-bash highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>rake deploy
</code></pre>
  </div>
</div>

_Note:_ Une fois le fichier <code class="highlighter-rouge">CNAME</code> pushé sur votre compte Git, GitHub redirigera automatiquement votre ancien sous-domaine (dans mon cas, <code class="highlighter-rouge">cedricbousmanne.github.io</code>) vers le nouveau domaine.

La partie technique est presque terminée. Toujours suivant [les instructions de GitHub](https://help.github.com/articles/tips-for-configuring-an-a-record-with-your-dns-provider/), je modifie mes enregistrements DNS pour que les deux URLs pointent vers les serveurs de GitHub :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>@ 10800 IN A 192.30.252.153
@ 10800 IN A 192.30.252.154
www 10800 IN A 192.30.252.153
www 10800 IN A 192.30.252.154
</code></pre>
  </div>
</div>

Il ne reste plus qu’à patienter : les modifications DNS peuvent prendre jusqu’à plusieurs heures pour être prises en compte.