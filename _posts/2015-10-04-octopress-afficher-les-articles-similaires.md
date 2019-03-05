---
id: 559
title: Octopress &#8211; Afficher les articles similaires
date: 2015-10-04 21:15:19.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/2015/10/04/octopress-afficher-les-articles-similaires.html
permalink: "/2015/10/04/octopress-afficher-les-articles-similaires/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '801'
categories:
- Non classé
---
Ce petit hack, tiré du blog de [Zhy Yong, “Add ‘Related Posts’ Section to Octopress”](http://zhuyong.me/blog/2014/02/05/add-related-posts-section-to-octopress/), permet d’afficher une liste d’articles relié au post affiché.

Il s’agit là d’une des _bonnes pratiques_, non seulement en terme de SEO, mais également pour aiguiller le lecteur une fois l’article terminé.

Premièrement, éditez le fichier <code class="highlighter-rouge">_config.yml</code> pour y ajouter la ligne suivante :

<div class="language-json highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="err">lsi&lt;/span>&lt;span class="p">:&lt;/span>&lt;span class="w"> &lt;/span>&lt;span class="kc">true&lt;/span>&lt;span class="w">
&lt;/span></code></pre>
  </div>
</div>

<!-- more -->

Ensuite, créez le fichier <code class="highlighter-rouge">source/_includes/post/related_posts.html</code> avec le contenu suivant :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>
  &lt;h3>Related posts&lt;/h3>
  &lt;ul class="posts">
  
    &lt;li class="related">
      &lt;a href="/2018/09/14/54402.html">&lt;/a>
    &lt;/li>
  
    &lt;li class="related">
      &lt;a href="/2018/09/14/test-de-forestry.html">Test de Forestry&lt;/a>
    &lt;/li>
  
    &lt;li class="related">
      &lt;a href="/2017/02/14/debian-laptop-tlp.html">Laptop sous Linux : gestion de l'énergie&lt;/a>
    &lt;/li>
  
  &lt;/ul>

</code></pre>
  </div>
</div>

Il suffit maintenant d’inclure le fichier nouvellement créé à l’endroit voulu, probablement quelque part dans votre fichier <code class="highlighter-rouge">source/_layouts/post.html</code>

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code> % include post/related_posts.html %}
</code></pre>
  </div>
</div>

Afin de générer l’index nécessaire au calcul des articles similaires, il faut installer la gem <code class="highlighter-rouge">gsl</code>. Ajouter donc la ligne suivante dans le <code class="highlighter-rouge">Gemfile</code>

<div class="language-text highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>gem 'gsl'
</code></pre>
  </div>
</div>

Installez-la en exécutant :

<div class="language-bash highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>bundle
</code></pre>
  </div>
</div>

Pour terminer, il faudra installer <code class="highlighter-rouge">gsl</code> sur votre système.

Pour MacOS :

<div class="language-bash highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>brew install gsl
</code></pre>
  </div>
</div>

Pour Ubuntu/Debian :

<div class="language-bash highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>&lt;span class="nb">sudo &lt;/span>gem install gsl-bin
</code></pre>
  </div>
</div>

Il ne reste plus qu’a regénérer le contenu statique de votre blog pour voir le résultat

<div class="language-bash highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>rake generate
</code></pre>
  </div>
</div>

### Note {#note}

Après cette modification, vous remarquerez deux nouvelles étapes qui peuvent prendre un peu plus de temps lors du <code class="highlighter-rouge">rake generate</code>: <code class="highlighter-rouge">Population LSI</code> et <code class="highlighter-rouge">Rebuilding index</code>

<div class="language-bash highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="nv">$ &lt;/span>rake preview
Starting to watch &lt;span class="nb">source &lt;/span>with Jekyll and Compass. Starting Rack on port 4000
Configuration file: /Users/cedric/Code/cedricbousmanne.github.io/_config.yml
&lt;span class="o">>>>&lt;/span> Compass is watching &lt;span class="k">for &lt;/span>changes. Press Ctrl-C to Stop.
            Source: &lt;span class="nb">source
       &lt;/span>Destination: public
      Generating...
&lt;span class="o">[&lt;/span>2015-10-04 21:29:47] INFO  WEBrick 1.3.1
&lt;span class="o">[&lt;/span>2015-10-04 21:29:47] INFO  ruby 2.0.0 &lt;span class="o">(&lt;/span>2014-02-24&lt;span class="o">)&lt;/span> &lt;span class="o">[&lt;/span>x86_64-darwin13.1.0]
&lt;span class="o">[&lt;/span>2015-10-04 21:29:47] INFO  WEBrick::HTTPServer#start: &lt;span class="nv">pid&lt;/span>&lt;span class="o">=&lt;/span>15455 &lt;span class="nv">port&lt;/span>&lt;span class="o">=&lt;/span>4000
    write public/stylesheets/screen.css

  Populating LSI...
Rebuilding index...
</code></pre>
  </div>
</div>