---
id: 566
title: Récupérer les méta-données d’une page HTML grâce à PHP
date: 2008-01-09 19:29:47.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/2008/01/09/recuperer-les-meta-donnees-dune-page-html-grace-a-php.html
permalink: "/2008/01/09/recuperer-les-meta-donnees-dune-page-html-grace-a-php/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '794'
categories:
- Non classé
---
Je viens de découvrir une fonction PHP sympathique : <code class="highlighter-rouge">[get_meta_tags](http://be.php.net/manual/fr/function.get-meta-tags.php)();</code>

Elle permet, comme son nom l’indique, de récupérer les meta-données d’une page HTML, par exemple :

<div class="language-php highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="cp"><?php</span>

&lt;span class="nv">$url&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nx">http&lt;/span>&lt;span class="o">://&lt;/span>&lt;span class="nx">www&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="nx">parenthese&lt;/span>&lt;span class="o">.&lt;/span>&lt;span class="nx">be&lt;/span>&lt;span class="o">/&lt;/span>&lt;span class="mi">2008&lt;/span>&lt;span class="o">/&lt;/span>&lt;span class="mo">01&lt;/span>&lt;span class="o">/&lt;/span>&lt;span class="mo">07&lt;/span>&lt;span class="o">/&lt;/span>&lt;span class="nx">blogstar&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="nx">derniere&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="nx">semaine&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="nx">pour&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="nx">les&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="nx">votes&lt;/span>&lt;span class="o">/&lt;/span>

&lt;span class="nv">$meta&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="nb">get_meta_tags&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="nv">$url&lt;/span>&lt;span class="p">);&lt;/span>

&lt;span class="k">echo&lt;/span> &lt;span class="nv">$meta&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="s1">'description'&lt;/span>&lt;span class="p">];&lt;/span> &lt;span class="c1">// Christophe vient d'annoncer que la cloture des votes était prévue pour la semaine prochaine... J'ai très peu de chance de gagner etant donné que le premier
&lt;/span>
&lt;span class="k">echo&lt;/span> &lt;span class="nv">$meta&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="s1">'keywords'&lt;/span>&lt;span class="p">];&lt;/span> &lt;span class="c1">// Buzz
&lt;/span>
&lt;span class="cp">?>&lt;/span>
</code></pre>
  </div>
</div>

Cela peut s’avérer très utile pour certaines utilisations (_teaser inside_, soyez attentif ;-))