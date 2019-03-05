---
id: 597
title: Utiliser son adresse Gmail comme adresse de messagerie instantanée
date: 2007-10-27 12:39:18.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/2007/10/27/utiliser-son-adresse-gmail-comme-adresse-de-messagerie-instantanee.html
permalink: "/2007/10/27/utiliser-son-adresse-gmail-comme-adresse-de-messagerie-instantanee/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '763'
categories:
- Non classé
---
Tout le monde connait [Gmail](http://www.gmail.com), le service e-mail de Google. Depuis peu, Gmail permet aussi d’utiliser [Gtalk,](http://www.google.com/talk/intl/fr/) un outil de messagerie vocale basé sur le protocole [XMPP](http://fr.wikipedia.org/wiki/XMPP).

L’inconvénient majeur, c’est que Google n’a développé Gtalk que pour Microsoft Windows, les utilisateurs Mac et Linux sont donc lésés puisque les appels vocaux ne sont disponibles qu’avec l’outil de Google.

[![Google Talk](/images/2007/10/google-talk.thumbnail.png)](/images/2007/10/google-talk.png)

Il n’en reste pas moins que Gtalk utilise le protocole XMPP (le protocole ouvert développé pour Jabber), et par conséquent, l’adresse Gmail est utilisable pour la messagerie instantanée. Voyons comment faire avec [Pidgin](http://www.pidgin.im/).

### Installer Pidgin {#installer-pidgin}

  * Sous windows : [télécharger l’installer](http://www.pidgin.im/download/windows/);

  * Sous Fedora : <code class="highlighter-rouge">su -c ‘yum install pidgin’</code>

  * Sous Ubuntu/Debian : <code class="highlighter-rouge">sudo apt-get install pidgin</code>;

  * [Sources](http://www.pidgin.im/download/source/)

### Configuration {#configuration}

Une fois Pidgin installé et lancé, sélectionnez <code class="highlighter-rouge">compte > modifier</code> et appuyez sur le bouton <code class="highlighter-rouge">ajouter</code>.

Choississez _XMPP_ comme protocole, entrez votre nom d’utilisateur Gmail et _gmail.com_ comme domaine.

[![Pidgin - Ajouter un compte](/images/2007/10/pidgin-ajouter-un-compte.thumbnail.png)](/images/2007/10/pidgin-ajouter-un-compte.png)

Enregistrez les paramètres puis connectez vous avec votre mot de passe Gmail.

Dans votre liste de contact apparait alors l’ensemble de vos contacts déjà présents dans Gmail. Vous pouvez dès lors les contacter en instantané sans passer par le site Gmail. Vous pouvez également ajouter d’autres contacts utilisant Jabber sur d’autres serveurs, c’est la magie d’un protocole libre ;-).

**De plus, Pidgin étant un client multiprotocoles, vous pouvez également vous connecter avec votre compte Hotmail pour continuer à discuter avec vos contacts et tenter de les convaincre de passer au XMPP!**