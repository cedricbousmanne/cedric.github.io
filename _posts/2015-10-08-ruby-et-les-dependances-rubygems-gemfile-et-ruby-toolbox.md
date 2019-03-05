---
id: 14
title: 'Ruby et les dépendances : RubyGems, Gemfile et Ruby Toolbox'
date: 2015-10-08 15:52:50.000000000 +00:00
author: cedric
layout: post


guid: https://cedric.io/2015/10/08/ruby-dependances-rubygems-gemfile-toolbox.html
permalink: "/2015/10/08/ruby-et-les-dependances-rubygems-gemfile-et-ruby-toolbox/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '272'
categories:
- Non classé
---
Quand on parle de Ruby on Rails, [RubyGems](https://rubygems.org/) n’est jamais très loin. RubyGems, c’est le service d’hébergement des _Gems_, l’écosystème des bibliothèques (_librairies_) inhérantes à Ruby.

A ce jour, RubyGems héberge plus de 6000 Gems et totalise plus de 6 milliards de téléchargements. Ce n’est pas étonnant, mais ça n’en est pas moins impressionnant.

## Anatomie d’un Gemfile {#anatomie-dun-gemfile}

Le fichier <code class="highlighter-rouge">Gemfile</code>, c’est un peu la liste de courses de votre application. Vous pouvez y préciser l’ensemble des librairies requises pour faire tourner votre app.

Ce fichier doit obligatoirement être installé à la racine de votre projet. Vous pouvez le constater dans l’arborescence ci-dessous, tirée d’un projet Rails tout neuf.

<!-- more -->

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>tree new-app
new-app
├── Gemfile
├── Gemfile.lock
├── README.rdoc
├── Rakefile
├── app
│   ├── assets
│   │   ├── images
│   │   ├── javascripts
│   │   │   └── application.js
│   │   └── stylesheets
│   │       └── application.css
│   ├── controllers
│   │   ├── application_controller.rb
│   │   └── concerns
│   ├── helpers
│   │   └── application_helper.rb
│   ├── mailers
│   ├── models
│   │   └── concerns
│   └── views
│       └── layouts
│           └── application.html.erb
(...)
38 directories, 40 files
</code></pre>
  </div>
</div>

### Contenu du fichier {#contenu-du-fichier}

Lorsque l’on démarre un nouveau projet Rails, le Gemfile par défaut ressemble à ceci (les lignes de commentaires ont été supprimées volontairement pour plus de clarté)

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="n">source&lt;/span> &lt;span class="s1">'https://rubygems.org'&lt;/span>

&lt;span class="n">gem&lt;/span> &lt;span class="s1">'rails'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'4.2.0'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'sqlite3'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'sass-rails'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'~> 5.0'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'uglifier'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'>= 1.3.0'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'coffee-rails'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'~> 4.1.0'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'jquery-rails'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'turbolinks'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'jbuilder'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'~> 2.0'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'sdoc'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'~> 0.4.0'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="ss">group: :doc&lt;/span>

&lt;span class="n">group&lt;/span> &lt;span class="ss">:development&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="ss">:test&lt;/span> &lt;span class="k">do&lt;/span>
  &lt;span class="n">gem&lt;/span> &lt;span class="s1">'byebug'&lt;/span>
  &lt;span class="n">gem&lt;/span> &lt;span class="s1">'web-console'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'~> 2.0'&lt;/span>
  &lt;span class="n">gem&lt;/span> &lt;span class="s1">'spring'&lt;/span>
&lt;span class="k">end&lt;/span>

</code></pre>
  </div>
</div>

#### Source {#source}

Sur la première ligne, <code class="highlighter-rouge">source</code> permet de définir le(s) dépôt(s) à consulter pour aller y télécharger les gems précisées plus bas dans le fichier.

Par défaut, seul le dépot de [rubygems.org](http://rubygems.org) est défini, mais on peut en ajouter d’autres.

[Gemfury](https://gemfury.com/), par exemple, est un service d’**hébergement de gems privé**. Une fois inscrit au service, vous devrez ajouter une ligne <code class="highlighter-rouge">source</code> au <code class="highlighter-rouge">Gemfile</code> de votre application pour pouvoir y télécharger les gems que vous aurez hébergées dessus.

#### Les lignes <code class="highlighter-rouge">gem</code> {#les-lignes-gem}

Les lignes <code class="highlighter-rouge">gem</code> permettent de spécifier les gems à installer pour faire tourner votre application. C’est une liste de dépendances, ni plus ni moins.

Vous aurez remarqué que certaines lignes prenaient un second paramètre, il s’agit du numéro de version de la gem que l’on souhaite utiliser.

Ce même numéro de gem est parfois préfixé d’autres caractères, tels que <code class="highlighter-rouge">~></code> ou <code class="highlighter-rouge">>=</code>, il s’agit là d’une indication autorisant une certaine souplesse dans le numéro de version requis.

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="c1"># (...)&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'rails'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'4.2.0'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'sqlite3'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'sass-rails'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'~> 5.0'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'uglifier'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'>= 1.3.0'&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'coffee-rails'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'~> 4.1.0'&lt;/span>
&lt;span class="c1"># (...)&lt;/span>
</code></pre>
  </div>
</div>

##### Explications {#explications}

  * <code class="highlighter-rouge">gem 'sqlite3'</code> : Aucun numéro de version n’est précisé, la dernière version sera automatiquement installée
  * <code class="highlighter-rouge">gem 'rails', '4.2.0'</code> : La version <code class="highlighter-rouge">4.2.0</code> sera utilisée. Aucune autre.
  * <code class="highlighter-rouge">gem 'coffee-rails', '~> 4.1.0'</code> : La version <code class="highlighter-rouge">4.1.0</code> sera utilisée, en étant permisif sur le dernier digit. La version <code class="highlighter-rouge">4.1.1</code>, si elle existe, pourra être prise en compte. En revanche, la version <code class="highlighter-rouge">4.2.0</code> ne sera pas autorisée.
  * <code class="highlighter-rouge">gem 'sass-rails', '~> 5.0'</code> : Comme pour la ligne précédente, les version <code class="highlighter-rouge">5.0</code>, <code class="highlighter-rouge">5.1</code>, etc. seront acceptées.
  * <code class="highlighter-rouge">gem 'uglifier', '>= 1.3.0'</code> : La version la plus récente, pourvu qu’elle soit **supérieure ou égale** à <code class="highlighter-rouge">1.3.0</code>

#### Les blocs <code class="highlighter-rouge">group</code> {#les-blocs-group}

Les blocs <code class="highlighter-rouge">group</code> permettent d’isoler certaines gems en fonction de l’environnement voulus. Dans l’exemple ci-dessous, les gems <code class="highlighter-rouge">byebug</code>, <code class="highlighter-rouge">webconsole</code> et <code class="highlighter-rouge">spring</code> ne seront accessible que dans les environnements <code class="highlighter-rouge">development</code> et <code class="highlighter-rouge">test</code>.

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="c1"># (...)&lt;/span>
&lt;span class="n">group&lt;/span> &lt;span class="ss">:development&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="ss">:test&lt;/span> &lt;span class="k">do&lt;/span>
  &lt;span class="n">gem&lt;/span> &lt;span class="s1">'byebug'&lt;/span>
  &lt;span class="n">gem&lt;/span> &lt;span class="s1">'web-console'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'~> 2.0'&lt;/span>
  &lt;span class="n">gem&lt;/span> &lt;span class="s1">'spring'&lt;/span>
&lt;span class="k">end&lt;/span>
</code></pre>
  </div>
</div>

De la même manière, on pourrait définir un <code class="highlighter-rouge">group :production</code> pour y placer les gems qui ne doivent être incluses qu’en environnement de production.

### Installer les dépendances {#installer-les-dépendances}

Une fois votre <code class="highlighter-rouge">Gemfile</code> complété, il suffit d’une commande pour que les dépendances de votre application soient installées.

Pour l’exercice, je vais ajouter la gem [Devise](https://rubygems.org/gems/devise) à mon <code class="highlighter-rouge">Gemfile</code>

<div class="language-ruby highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="n">source&lt;/span> &lt;span class="s1">'https://rubygems.org'&lt;/span>

&lt;span class="n">gem&lt;/span> &lt;span class="s1">'rails'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'4.2.0'&lt;/span>
&lt;span class="c1"># (...)&lt;/span>
&lt;span class="n">gem&lt;/span> &lt;span class="s1">'devise'&lt;/span>&lt;span class="p">,&lt;/span> &lt;span class="s1">'3.5.2'&lt;/span>

</code></pre>
  </div>
</div>

Dans mon terminal, je me rends à la racine de mon projet et j’exécute la commande <code class="highlighter-rouge">bundle</code> :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>$ cd Code/new-app
$ bundle
Fetching gem metadata from https://rubygems.org/............
Fetching additional metadata from https://rubygems.org/..
Resolving dependencies...
Using rake 10.4.2
Using i18n 0.7.0
Using json 1.8.3
Using minitest 5.8.1
Using thread_safe 0.3.5
Using tzinfo 1.2.2
Using activesupport 4.2.0
Using builder 3.2.2
Using erubis 2.7.0
Using mini_portile 0.6.2
Using nokogiri 1.6.6.2
Using rails-deprecated_sanitizer 1.0.3
Using rails-dom-testing 1.0.7
Using loofah 2.0.3
Using rails-html-sanitizer 1.0.2
Using actionview 4.2.0
Using rack 1.6.4
Using rack-test 0.6.3
Using actionpack 4.2.0
Using globalid 0.3.6
Using activejob 4.2.0
Using mime-types 2.6.2
Using mail 2.6.3
Using actionmailer 4.2.0
Using activemodel 4.2.0
Using arel 6.0.3
Using activerecord 4.2.0
Using bcrypt 3.1.10
Using debug_inspector 0.0.2
Using binding_of_caller 0.7.2
Using bundler 1.7.3
Using byebug 6.0.2
Using coffee-script-source 1.9.1.1
Using execjs 2.6.0
Using coffee-script 2.4.1
Using thor 0.19.1
Using railties 4.2.0
Using coffee-rails 4.1.0
Using orm_adapter 0.5.0
Using responders 2.1.0
Using warden 1.2.3
Installing devise 3.5.2
Using multi_json 1.11.2
Using jbuilder 2.3.2
Using jquery-rails 4.0.5
Using sprockets 3.4.0
Using sprockets-rails 2.3.3
Using rails 4.2.0
Using rdoc 4.2.0
Using sass 3.4.18
Using tilt 2.0.1
Using sass-rails 5.0.4
Using sdoc 0.4.1
Using spring 1.4.0
Using sqlite3 1.3.10
Using turbolinks 2.5.3
Using uglifier 2.7.2
Using web-console 2.2.1
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
</code></pre>
  </div>
</div>

L’ensemble de mon <code class="highlighter-rouge">Gemfile</code> est vérifié. Si la gem est déjà installée dans le système, <code class="highlighter-rouge">bundle</code> nous indique <code class="highlighter-rouge">Using [gem name]</code>. Dans le cas contraire, comme à la ligne 47, il nous indique <code class="highlighter-rouge">Installing [gem name]</code>.

Notez également qu’après avoir installé ou mis à jour une gem, il est nécessaire de redémarrer votre serveur local.

## Trouvez des gems {#trouvez-des-gems}

Comme je l’ai précisé en début d’article, le site [RubyGems](https://rubygems.org/) héberge et indexe des milliers de gems. Cependant, lorsque j’effectue une recherche, je préfère utiliser le site [Ruby Toolbox](https://www.ruby-toolbox.com/).

Outre l’outil de recherche, Ruby Toolbox trie les gems par catégorie et par popularité. Cette information est souvent un bon indicateur lorsqu’on se lance dans un développement qui nécessite l’utilisation de gems inconnues. Le taux d’utilisation et la fréquence de mise à jour sont souvent déterminante dans mon choix.

Pour reprendre Devise comme exemple, si on consulte la [page RubyGems consacrée à Devise](https://www.ruby-toolbox.com/projects/devise), on y trouve les informations suivantes :

![Ruby Toolbox - Devise](/images/ruby-toolbox-devise.png) 

Les informations, reprises sur les pages RubyGems et GitHub du projet, permettent de se faire une bonne idée de la qualité du projet :

  * Le développement est **actif** (_released about a month ago_), ce qui indique probablement que la gem est **compatible avec la dernière version de Rails**
  * Le développement est **soutenu** (129 releases en 5 ans)
  * La gem est particulièrement **ancienne** (première release il y a 5 ans), ce qui indique probablement qu’elle est **testée et à toute épreuve**
  * Les _related projects_ de la catégorie _rails authentication_ sont tous moins bien côté, ce qui signifie que Devise est la gem **la plus populaire dans sa catégorie**

## S’assurer de la qualité {#sassurer-de-la-qualité}

Pour s’assurer de la qualité d’un code, le mieux serait de le parcourir entièrement. Cette idée est bien entendu irréalisable au quotidien, nous allons donc essayer d’automatiser les choses pour se donner une vue d’ensemble.

Nous allons télécharger le code de Devise depuis son dépôt GitHub :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>$ cd /tmp
$ git clone https://github.com/plataformatec/devise.git
$ cd devise/
</code></pre>
  </div>
</div>

Grâce à [<code class="highlighter-rouge">cloc</code>](http://cloc.sourceforge.net), nous allons analyser le contenu des dossiers <code class="highlighter-rouge">app</code> et <code class="highlighter-rouge">lib</code> (là ou le code se situe) :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>$ cloc app lib
     101 text files.
      98 unique files.
      25 files ignored.

http://cloc.sourceforge.net v 1.62  T=0.34 s (225.5 files/s, 18673.0 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Ruby                            76            914           1840           3540
-------------------------------------------------------------------------------
SUM:                            76            914           1840           3540
-------------------------------------------------------------------------------

</code></pre>
  </div>
</div>

3540 lignes de codes, c’est énorme. D’ordinaire, si le code semble trop important, cela pourrait indiquer une certaine lourdeur, voire une mauvaise qualité. Dans ce cas précis, Devise est la libraire la plus complète en matière d’authentification, et ça ne m’inquiète pas plus que ça.

Voyons maintenant les tests, habituellement situés dans les dossiers <code class="highlighter-rouge">test</code> ou <code class="highlighter-rouge">spec</code> :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>$ cloc test spec
     127 text files.
     127 unique files.
      14 files ignored.

http://cloc.sourceforge.net v 1.62  T=0.48 s (236.3 files/s, 18660.3 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Ruby                           108           1632            339           6923
HTML                             3              3              3             72
YAML                             3              2              5             25
-------------------------------------------------------------------------------
SUM:                           114           1637            347           7020
-------------------------------------------------------------------------------
</code></pre>
  </div>
</div>

Devise compte donc deux fois plus de lignes de tests que de lignes de code. L’application est très bien couverte et c’est une indication très rassurante.

Pour terminer, nous pouvons jeter un oeil au code source de la gem, qui se situe habituellement dans le dossier <code class="highlighter-rouge">lib</code>. La lecture du code, en plus de vous donner un aperçu de sa qualité, peut également être très instructif.