---
id: 558
title: 'Octopress &#8211; Du code haut en couleurs'
date: 2015-10-05T22:42:00+00:00
author: cedric
layout: post
guid: https://cedric.io/2015/10/05/octopress-du-code-haut-en-couleurs.html
permalink: /2015/10/05/octopress-du-code-haut-en-couleurs/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "802"
categories:
  - Non classé
---
Par défaut, Octopress intègre [Pygments](http://pygments.org/) pour gérer la colorisation syntaxique du code, mais je trouvais le résultat un peu triste. Après quelques recherches sur [RubyGems](https://rubygems.org/), je suis tombé sur _[Octopress Codeblock](https://github.com/octopress/codeblock)_

Commençons par éditer le fichier <code class="highlighter-rouge">Gemfile</code> pour y ajouter la Gem [octopress-codeblock](https://github.com/octopress/codeblock)

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="n">group&lt;/span> &lt;span class="ss">:jekyll_plugins&lt;/span> &lt;span class="k">do&lt;/span>
  &lt;span class="n">gem&lt;/span> &lt;span class="s1">'octopress-codeblock'&lt;/span>
&lt;span class="k">end&lt;/span>
</code></pre>
  </div>
</div>

<!-- more -->

Mettons à jour les dépendances, en console, avec la commande <code class="highlighter-rouge">bundle</code>

<div class="language-sh highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>bundle
</code></pre>
  </div>
</div>

_Attention_: n’oubliez pas de redémarrer votre serveur local après avoir remis à jour les dépendances. Si la commande <code class="highlighter-rouge">rake preview</code>, quiitez-la avec <code class="highlighter-rouge">Ctrl+C</code> et relancez-la.

Il ne reste plus qu’a encapsuler votre codes des balises liquid <code class="highlighter-rouge">codeblock</code> et <code class="highlighter-rouge">endcodeblock</code>.

## Exemples {#exemples}

### Un peu de Ruby {#un-peu-de-ruby}



#### Résultat {#résultat}

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>  &lt;span class="n">firstname&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="s2">"John"&lt;/span>
  &lt;span class="n">lastname&lt;/span>  &lt;span class="o">=&lt;/span> &lt;span class="s2">"Doe"&lt;/span>
  &lt;span class="n">echo&lt;/span> &lt;span class="s2">"&lt;/span>&lt;span class="si">#{&lt;/span>&lt;span class="n">firstname&lt;/span>&lt;span class="si">}&lt;/span>&lt;span class="s2"> &lt;/span>&lt;span class="si">#{&lt;/span>&lt;span class="n">lastname&lt;/span>&lt;span class="si">}&lt;/span>&lt;span class="s2">"&lt;/span>
</code></pre>
  </div>
</div>

### Options {#options}

On peut également ajouter un titre et un lien



#### Résultat {#résultat-1}