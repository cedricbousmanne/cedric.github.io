---
id: 15
title: 'Octopress : Utiliser les Hooks pour surcharger les permalinks'
date: 2015-10-07T09:20:08+00:00
author: cedric
layout: post
guid: https://cedric.io/2015/10/07/octopress-hooks-permalinks.html
permalink: /2015/10/07/octopress-utiliser-les-hooks-pour-surcharger-les-permalinks/
wp_crosspost_destination:
  - akyrho.wordpress.com
wordpress_post_id:
  - "271"
categories:
  - Non classé
---
La gestion des permalinks sous [Octopress](http://octopress.org/) ne permet, par défaut, pas beaucoup de fantaisie. Elle sera généralement structurée d’une des manières suivantes :

  * <code class="highlighter-rouge">/:categories/:title</code>
  * <code class="highlighter-rouge">/:year/:month/:day/:title/</code>
  * <code class="highlighter-rouge">/:title</code>

Certains cas de figures ne sont pas gérés par défaut. Par exemple, je me suis retrouvé confronté à la situation suivante :

Pour un blog donné, nous avons trois “types” de posts : des articles concernant l’entreprise, des articles concernant le produits, et des vidéos. Chaque article, peu importe son type, peut appartenir à une ou plusieurs catégories.

Pour ce cas précis, je voulais un shéma d’URL reprenant le type d’article, suivit du titre de l’article. Le type d’un article étant défini par son <code class="highlighter-rouge">layout</code>, on pourrait penser à une structure de permalink du type <code class="highlighter-rouge">:layout/:title</code>. Malheureusement, cette solution ne fonctionne pas par défaut sous Octopress.

On pourrait également proposer comme solution de préciser, dans les entêtes de chaque article, la valeur <code class="highlighter-rouge">permalink</code> propre à chaque article :

<div class="language-liquid highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>---
layout: videos
title: "Ma vidéo"
date: 2015-10-07 09:20:08 +0200
share: true
published: true
permalink: videos/ma-video
---
</code></pre>
  </div>
</div>

Cette solution n’est pas efficace pour deux raisons :

  * Nous avons déjà plusieurs dizaines d’articles existants,
  * C’est une étape supplémentaire à chaque création d’article pour la personne en charge du blog

## La solution : utiliser les <code class="highlighter-rouge">hooks</code> {#la-solution--utiliser-les-hooks}

Heureusement, nous avons une solution disponible _out of the box_ : la libraire [<code class="highlighter-rouge">Octopress::Hook</code>](https://github.com/octopress/hooks)  
<!-- more -->

  
Les _Hooks_ permettent d’intéragir avec un <code class="highlighter-rouge">Post</code> au moment du <code class="highlighter-rouge">rake generate</code>. Ils permettent également d’intéragir avec d’autres types d’objets :

  * <code class="highlighter-rouge">Site</code> : permet d’intéragir avec l’instance Site
  * <code class="highlighter-rouge">Page</code> : permet d’intéragir avec une Page
  * <code class="highlighter-rouge">Document</code> : permet d’intéragir avec une collection de Documents

Les _Hooks_ proposent plusieurs méthodes pour intéragir avec une instance donnée :

  * <code class="highlighter-rouge">reset</code> : permet de réinitialiser les variable _avant_ chaque <code class="highlighter-rouge">build</code>
  * <code class="highlighter-rouge">post_init</code> : permet d’intéragir avec les objets _après_ qu’ils n’aient été initialisés
  * <code class="highlighter-rouge">pre_read</code> : permet d’intéragir avec les objets _avant_ que les fichiers statiques, les posts et les pages ne soient lus
  * <code class="highlighter-rouge">post_read</code> : permet d’intéragir _après_ que les fichiers ne soit lu mais _avant_ que le générateur ne soit enclanché
  * <code class="highlighter-rouge">pre_render</code> : permet d’intéragir _avant_ que les posts et pages ne soient rendu (<code class="highlighter-rouge">rendered</code>)
  * <code class="highlighter-rouge">post_write</code> : permet d’intéragir _après_ que tous les documents aient été écrits sur le disque

# Exemple d’utilisation {#exemple-dutilisation}

Dans notre cas précis, nous voulons intéragir avec les objets de type <code class="highlighter-rouge">Posts</code> _après_ qu’ils n’aient été initialisés

Pour ce faire, nous allons créer une <code class="highlighter-rouge">class</code> qui héritera de <code class="highlighter-rouge">Octopress::Hooks::Post</code> et qui surchargera la méthode <code class="highlighter-rouge">post_init</code>.

Créons un fichier <code class="highlighter-rouge">plugins/hooks.rb</code> :

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>
&lt;span class="nb">require&lt;/span> &lt;span class="s1">'octopress-hooks'&lt;/span>
&lt;span class="k">module&lt;/span> &lt;span class="nn">Jekyll&lt;/span>
  &lt;span class="k">class&lt;/span> &lt;span class="nc">MyPageHook&lt;/span> &lt;span class="o">&lt;&lt;/span> &lt;span class="no">Octopress&lt;/span>&lt;span class="o">::&lt;/span>&lt;span class="no">Hooks&lt;/span>&lt;span class="o">::&lt;/span>&lt;span class="no">Post&lt;/span>

    &lt;span class="k">def&lt;/span> &lt;span class="nf">post_init&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">post&lt;/span>&lt;span class="p">)&lt;/span>

    &lt;span class="k">end&lt;/span>

  &lt;span class="k">end&lt;/span>
&lt;span class="k">end&lt;/span>

</code></pre>
  </div>
</div>

La variable <code class="highlighter-rouge">post</code> reçue par notre méthode <code class="highlighter-rouge">post_init</code> correspond à un article donné. La méthode <code class="highlighter-rouge">data</code> appliquée à l’objet renvoie un <code class="highlighter-rouge">Hash</code> reprenant tous les <code class="highlighter-rouge">headers</code> du fichier ainsi que son contenu. Nous allons donc y retrouver les valeurs de <code class="highlighter-rouge">:title</code>, <code class="highlighter-rouge">:categories</code>, etc.

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="p">{&lt;/span>
  &lt;span class="s2">"layout"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="s2">"post"&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"title"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="s2">"Octopress : surcharger les permalinks"&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"date"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="mi">2015&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="mi">10&lt;/span>&lt;span class="o">-&lt;/span>&lt;span class="mo">070&lt;/span>&lt;span class="mi">9&lt;/span>&lt;span class="p">:&lt;/span> &lt;span class="mi">20&lt;/span>&lt;span class="p">:&lt;/span> &lt;span class="mi">08&lt;/span>&lt;span class="o">+&lt;/span>&lt;span class="mo">0200&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"share"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="kp">true&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"published"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="kp">true&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"categories"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="p">[&lt;/span>
    &lt;span class="s2">"Jekyll"&lt;/span>&lt;span class="p">,&lt;/span>
    &lt;span class="s2">"Octopress"&lt;/span>
  &lt;span class="p">],&lt;/span>
  &lt;span class="s2">"description"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="s2">"TODO"&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"image"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="p">{&lt;/span>
    &lt;span class="s2">"thumb"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="s2">"TODO"&lt;/span>
  &lt;span class="p">},&lt;/span>
  &lt;span class="s2">"date_xml"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="s2">"2015-10-07T09:20:08+02:00"&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"date_text"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="s2">"Oct 7th, 2015"&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"time_text"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="s2">"9:20 am"&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"date_html"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="s2">"&lt;time class='entry-date' datetime='2015-10-07T09:20:08+02:00'>&lt;span class='date'>&lt;span class='date-month'>Oct&lt;/span> &lt;span class='date-day'>7&lt;/span>&lt;span class='date-suffix'>th&lt;/span>, &lt;span class='date-year'>2015&lt;/span>&lt;/span>&lt;/time>"&lt;/span>&lt;span class="p">,&lt;/span>
  &lt;span class="s2">"date_time_html"&lt;/span>&lt;span class="o">=>&lt;/span>&lt;span class="s2">"&lt;time class='entry-date' datetime='2015-10-07T09:20:08+02:00'>&lt;span class='date'>&lt;span class='date-month'>Oct&lt;/span> &lt;span class='date-day'>7&lt;/span>&lt;span class='date-suffix'>th&lt;/span>, &lt;span class='date-year'>2015&lt;/span>&lt;/span> &lt;span class='time'>9:20 am&lt;/span>&lt;/time>"&lt;/span>
&lt;span class="p">}&lt;/span>
</code></pre>
  </div>
</div>

Dans notre cas, nous souhaitons définir une valeur pour ce qui aurait pu être la valeur <code class="highlighter-rouge">:permalink</code> dans les headers du fichier.

Nous allons donc :

  * Vérifier la présence de <code class="highlighter-rouge">permalink</code> 
      * Si elle n’existe pas, la définir
      * Sinon, ne rien faire

De cette manière, si nous décidons de définir un <code class="highlighter-rouge">permalink</code> particulier pour un article, celui-ci ne sera pas écrasé par le <code class="highlighter-rouge">Hook</code> au moment de gérerer le code HTML du site.

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>  &lt;span class="k">def&lt;/span> &lt;span class="nf">post_init&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">post&lt;/span>&lt;span class="p">)&lt;/span>
    &lt;span class="k">unless&lt;/span> &lt;span class="n">post&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="nf">data&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="nf">key?&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s1">'permalink'&lt;/span>&lt;span class="p">)&lt;/span>
      &lt;span class="n">post&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="nf">data&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="s1">'permalink'&lt;/span>&lt;span class="p">]&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="s2">"&lt;/span>&lt;span class="si">#{&lt;/span>&lt;span class="n">post&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="nf">data&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="s1">'layout'&lt;/span>&lt;span class="p">]&lt;/span>&lt;span class="si">}&lt;/span>&lt;span class="s2">/:title"&lt;/span>
    &lt;span class="k">end&lt;/span>
  &lt;span class="k">end&lt;/span>
</code></pre>
  </div>
</div>

## Le code complet {#le-code-complet}

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>
&lt;span class="nb">require&lt;/span> &lt;span class="s1">'octopress-hooks'&lt;/span>
&lt;span class="k">module&lt;/span> &lt;span class="nn">Jekyll&lt;/span>
  &lt;span class="k">class&lt;/span> &lt;span class="nc">MyPageHook&lt;/span> &lt;span class="o">&lt;&lt;/span> &lt;span class="no">Octopress&lt;/span>&lt;span class="o">::&lt;/span>&lt;span class="no">Hooks&lt;/span>&lt;span class="o">::&lt;/span>&lt;span class="no">Post&lt;/span>

    &lt;span class="k">def&lt;/span> &lt;span class="nf">post_init&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="n">post&lt;/span>&lt;span class="p">)&lt;/span>
      &lt;span class="k">unless&lt;/span> &lt;span class="n">post&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="nf">data&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="nf">key?&lt;/span>&lt;span class="p">(&lt;/span>&lt;span class="s1">'permalink'&lt;/span>&lt;span class="p">)&lt;/span>
        &lt;span class="n">post&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="nf">data&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="s1">'permalink'&lt;/span>&lt;span class="p">]&lt;/span> &lt;span class="o">=&lt;/span> &lt;span class="s2">"&lt;/span>&lt;span class="si">#{&lt;/span>&lt;span class="n">post&lt;/span>&lt;span class="p">.&lt;/span>&lt;span class="nf">data&lt;/span>&lt;span class="p">[&lt;/span>&lt;span class="s1">'layout'&lt;/span>&lt;span class="p">]&lt;/span>&lt;span class="si">}&lt;/span>&lt;span class="s2">/:title"&lt;/span>
      &lt;span class="k">end&lt;/span>
    &lt;span class="k">end&lt;/span>

  &lt;span class="k">end&lt;/span>
&lt;span class="k">end&lt;/span>

</code></pre>
  </div>
</div>