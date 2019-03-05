---
id: 594
title: Utiliser Gravatar pour votre projet 2.0
date: 2007-10-31 10:20:06.000000000 +00:00
author: cedric
layout: post

guid: https://cedric.io/2007/10/31/utiliser-gravatar-pour-votre-projet-20.html
permalink: "/2007/10/31/utiliser-gravatar-pour-votre-projet-2-0/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '766'
categories:
- Non classé
---
_Billet original rédigé pour [Smashing Coding](http://smashingcoding.com/2007/10/31/utiliser-gravatar-pour-votre-projet-20/)_

Plantons le décors : vous développez un site web 2.0, et vous désirez proposer à vos visiteurs la possibilité d’utiliser un avatar pour afficher graphiquement leur identité lors de leurs interventions sur le site.

La façon la plus directe, à priori, consisterait à coder une méthode vous-meme. Mais les inconvénients sont de poids, surtout si vous désirez _bien_ faire les choses :

  * Nécessité d’utiliser des librairies lourdes (GD, ImageMagick);

  * Proposer l’upload, le recadrage, etc. demande un temps considérable;

  * Exige de l’espace disque, surtout si votre projet commence à etre connu;

  * etc.

Un homme intelligent évite l’effort inutile, un homme intelligent utilisera donc [Gravatar](http://).

![Gravatar](/images/2007/10/gravatar.gif) Gravatar (Globally Recognized Avatar), est un service en ligne permettant de lier une adresse e-mail à un avatar. L’avatage principal est d’éviter aux gens de devoir re-télécharger leur avatar sur l’ensemble des sites auxquels ils souscrivent. Le secondaire est d’offrir une solution facile aux webmasters désirant proposer cette fonctionnalité sur leur site.

Le code permettant de récuperer cet avatar n’importe où est très simple :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>$email = "email@domain.tld";
$default = "http://www.somewhere.com/homestar.jpg";
$size = 80;
$gravatar = "http://www.gravatar.com/avatar.php?gravatar_id=".md5($email)."&default=".urlencode($default)."&size=".$size;
</code></pre>
  </div>
</div>

  * La variable **$email** contiendra l’adresse e-mail du membre dont on veut afficher le gravatar;

  * La variable **$default** définira l’image par défaut, utilisée si aucun gravatar n’est attaché à l’adresse e-mail renseignée;

  * La variable **$size** définira, en pixel, la taille du gravatar (maximum 80);

  * Et enfin la variable **$gravatar** permettra l’affichage.

Pour afficher votre image ou vous le désirez, placez ce code dans votre page :

<code class="highlighter-rouge">&lt;img src="<?php echo $gravatar ?>" /></code>

Et voilà, j’espère que ça vous évitera des heures interminables de code!