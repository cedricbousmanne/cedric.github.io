---
id: 4441
title: 'Accélérer l&rsquo;exécution de la commande bundle et l&rsquo;installation des gems'
date: 2018-12-05T11:41:08+00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4441
permalink: /2018/12/05/accelerer-bundle-installation-gems/
mf2_mp-syndicate-to:
  - 'a:1:{i:0;s:22:"bridgy-publish_twitter";}'
geo_weather:
  - 'a:2:{s:5:"units";s:1:"C";s:4:"icon";s:4:"none";}'
geo_public:
  - "0"
mf2_syndication:
  - 'a:4:{i:0;s:53:"https://twitter.com/akyrho/status/1070266841392652288";i:1;s:46:"https://ruby.social/@akyrho/101188014197214345";i:2;s:124:"https://medium.com/@akyrho/acc%C3%A9l%C3%A9rer-lex%C3%A9cution-de-la-commande-bundle-et-l-installation-des-gems-f42661e464a3";i:3;s:98:"https://news.humancoders.com/t/ruby/items/16483-accelerer-l-execution-de-la-commande-bundle-et-l-i";}'
  - 'a:4:{i:0;s:53:"https://twitter.com/akyrho/status/1070266841392652288";i:1;s:46:"https://ruby.social/@akyrho/101188014197214345";i:2;s:124:"https://medium.com/@akyrho/acc%C3%A9l%C3%A9rer-lex%C3%A9cution-de-la-commande-bundle-et-l-installation-des-gems-f42661e464a3";i:3;s:98:"https://news.humancoders.com/t/ruby/items/16483-accelerer-l-execution-de-la-commande-bundle-et-l-i";}'
mastoshare-post-status:
  - 'off'
mastoshareshare-lastSuccessfullTootURL:
  - https://ruby.social/@akyrho/101188008090553972
categories:
  - web
tags:
  - gems
  - rails
  - ruby
  - ruby on rails
  - RubyGems
kind:
  - Article
---
Il y a quelques jours, j&rsquo;ai travaillé sur une mise à jour majeure d&rsquo;une application écrite en Ruby on Rails. L&rsquo;application tournait sur la version 3.2 du framework, et celle-ci étant dépréciée depuis longtemps, il était largement temps de la faire passer en version 5.2.

Cela signifie donc deux passages de versions majeures et 4 passages de versions mineures. Avec, pour chaque saut de version, la nécessité de mettre à jour les versions des gems utilisées. Autant dire que la commande `bundle` a été sollicitée.

Le point de frustration était l&rsquo;approche itérative de `bundle` (la première dépendance est vérifiée et mise à jour, puis on passe à la seconde, etc) dans un fichier qui comptait pas moins de 137 dépendances. Ce qui m&rsquo;a poussé à fouiller la documentation de `bundle` pour y découvrir l&rsquo;option `--jobs` qui permet de définir un nombre de processus concurrentiels.

Pour lancer 4 jobs en parallèle, on peut donc lancer la commande comme ceci : 

<pre>bundle install --jobs=4</pre>

Il est également possible de définir cette configuration par défaut pour ne plus avoir à s&rsquo;en soucier à l&rsquo;avenir : 

<pre>bundle config --global jobs 4</pre>

En bonus, on peut également demander à ne plus installer les documentations par défaut (soyons francs, tout le monde va chercher la documentation sur Internet, il est inutile d&rsquo;avoir une version locale). Pour ce faire, il est nécessaire de créer un fichier `~/.gemrc` et d&rsquo;y inclure :

<pre>gem: --no-rdoc --no-ri</pre>