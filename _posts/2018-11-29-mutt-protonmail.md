---
id: 4408
title: Mutt + ProtonMail
date: 2018-11-29T09:02:58+00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4408
permalink: /2018/11/29/mutt-protonmail/
mf2_mp-syndicate-to:
  - 'a:1:{i:0;s:22:"bridgy-publish_twitter";}'
geo_weather:
  - 'a:2:{s:5:"units";s:1:"C";s:4:"icon";s:4:"none";}'
geo_public:
  - "0"
mf2_syndication:
  - 'a:3:{i:0;s:53:"https://twitter.com/akyrho/status/1068052726272221185";i:1;s:46:"https://ruby.social/@akyrho/101153426687520401";i:2;s:72:"https://www.linkedin.com/feed/update/urn:li:activity:6473820154252840960";}'
  - 'a:3:{i:0;s:53:"https://twitter.com/akyrho/status/1068052726272221185";i:1;s:46:"https://ruby.social/@akyrho/101153426687520401";i:2;s:72:"https://www.linkedin.com/feed/update/urn:li:activity:6473820154252840960";}'
mastoshare-post-status:
  - 'off'
mastoshareshare-lastSuccessfullTootURL:
  - https://ruby.social/@akyrho/101153412293644855
categories:
  - Non classé
tags:
  - command line
  - mail
  - mutt
  - offlineimap
  - protonmail
kind:
  - Article
---
Il y a maintenant plusieurs semaines que j&rsquo;utilise [ProtonMail](https://protonmail.com/). Bien que rassembler mes 7 adresses précédentes sur une seule m&rsquo;a grandement simplifié la vie, je ne suis toujours pas satisfait des clients disponibles. Sous Linux, seul Thunderbird est actuellement disponible, à moins d&rsquo;utiliser de webmail &#8211; ce que je fais pour l&rsquo;instant.

Il y a quelques années, j&rsquo;avais testé [Mutt](https://fr.wikipedia.org/wiki/Mutt) un peu comme un jeu. La raison pour laquelle j&rsquo;avais arrêté de l&rsquo;utiliser était justement le nombre d&rsquo;adresse que je devais gérer : l&rsquo;outil était certes intéressant, mais difficile à utiliser avec autant de compte.

Maintenant que j&rsquo;ai résolu ce problème, j&rsquo;avais envie de redonner une chance à ce client minimaliste et, par la même occasion, voir s&rsquo;il était possible de faire cohabiter [Mutt et ProtonMail](https://spaceandtim.es/code/protonmail_mutt/).

## Installation et premier lancement

Pour installer `mutt`, il suffit d&rsquo;installer le paquet du même nom :

<pre>sudo apt install mutt</pre>

En lancant pour la première fois la commande `mutt`, je reçois une erreur :

<pre>/var/mail/cedric: Aucun fichier ou dossier de ce type (errno = 2)</pre>

Je crée le fichier en question et je lui donne les permissions nécessaire à mon utilisateur :

<pre>sudo mkdir -p /var/mail/$(whoami)
sudo chown $(whoami):$(whoami) /var/mail/$(whoami)
</pre>

J&rsquo;en profite pour initialiser le fichier de configuration `.muttrc`

<pre>vim ~/.muttrc 
</pre>

<pre>set realname = "Your Name"
set header_cache =~/.mutt/cache/headers
set certificate_file =~/.mutt/certificates
set message_cachedir =~/.mutt/cache/bodies
</pre>

Lancer une nouvelle fois la commande `mutt`, ne donne plus d&rsquo;erreur.

<figure id="attachment_4409" style="width: 1024px" class="wp-caption alignnone"><img class="wp-image-4409 size-large" src="https://i0.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-28-14-04-07.png?resize=900%2C490&#038;ssl=1" alt="" width="900" height="490" srcset="https://i0.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-28-14-04-07.png?resize=1024%2C557&ssl=1 1024w, https://i0.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-28-14-04-07.png?resize=300%2C163&ssl=1 300w, https://i0.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-28-14-04-07.png?resize=768%2C418&ssl=1 768w, https://i0.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-28-14-04-07.png?resize=668%2C364&ssl=1 668w, https://i0.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-28-14-04-07.png?w=1545&ssl=1 1545w" sizes="(max-width: 900px) 100vw, 900px" data-recalc-dims="1" /><figcaption class="wp-caption-text">Premier écran du logiciel Mutt &#8211; un client mail en ligne de commande. Au moins, c&rsquo;est épuré 🙂</figcaption></figure>

## Configuration de mutt

Note : je pars du principe que le [Bridge pour Linux](https://protonmail.com/download/protonmail-bridge_1.1.0-1_amd64.deb) est installé et lancé.

J&rsquo;ajoute au fichier de configuration `.muttrc` les lignes suivantes:

<pre># "+" substitutes for `folder`
set mbox_type=Maildir
set folder=/var/mail/cedric/
set spoolfile=+INBOX
set record=+Sent
set postponed=+Drafts
set trash=+Trash
set mail_check=2 # seconds

# smtp
source ~/docs/keys/mail
set smtp_url=smtp://$my_user:$my_pass@127.0.0.1:1025
set ssl_force_tls
set ssl_starttls

</pre>

Et dans le fichier `~/docs/keys/mail`:

<pre>set my_user=EMAIL
set my_pass=MOT_DE_PASSE_DU_BRIDGE
</pre>

## Installation et configuration de OfflineIMAP

J&rsquo;installe OfflineIMAP :

<pre>sudo pip install offlineimap</pre>

Puis je crée un fichier de configuration `.offlineimaprc<code> :`</code>

<pre>[general]
accounts = main

[Account main]
localrepository = main-local
remoterepository = main-remote

# full refresh, in min
autorefresh = 0.2

# quick refreshs between each full refresh
quick = 10

# update notmuch index after sync
postsynchook = notmuch new


[Repository main-local]
type = Maildir
localfolders = /var/mail/cedric

# delete remote mails that were deleted locally
sync_deletes = yes


[Repository main-remote]
type = IMAP
remoteport = 1143
remotehost = 127.0.0.1
remoteuser = EMAIL
remotepass = MOT_DE_PASSE_DU_BRIDGE
keepalive = 60
holdconnectionopen = yes

# delete local mails that were deleted on the remote server
expunge = yes

# sync only these folders
folderfilter = lambda foldername: foldername in ['INBOX', 'Archive', 'Sent']

# is broken, but connecting locally to bridge so should be ok
ssl = no

</pre>

On lance la commande `offlineimap`, et, si tout s&rsquo;est bien passé, on peut commencer à voir la progression de la synchronisation avec ProtonMail :

<pre>OfflineIMAP 7.2.1
  Licensed under the GNU GPL v2 or any later version (with an OpenSSL exception)
imaplib2 v2.57 (bundled), Python v2.7.14, OpenSSL 1.0.2g  1 Mar 2016
Account sync main:
 *** Processing account main
 Establishing connection to 127.0.0.1:1143 (main-remote)
 Creating folder INBOX[main-local]
 Creating new Local Status db for main-local:INBOX
 Creating folder Archive[main-local]
 Creating new Local Status db for main-local:Archive
 Creating folder Sent[main-local]
 Creating new Local Status db for main-local:Sent
Folder Archive [acc: main]:
 Syncing Archive: IMAP -&gt; Maildir
Folder INBOX [acc: main]:
 Syncing INBOX: IMAP -&gt; Maildir
Folder Archive [acc: main]:
 Copy message UID 1 (1/263) main-remote:Archive -&gt; main-local:Archive
Folder INBOX [acc: main]:
 Copy message UID 1 (1/49) main-remote:INBOX -&gt; main-local:INBOX
Folder Archive [acc: main]:
 Copy message UID 2 (2/263) main-remote:Archive -&gt; main-local:Archive
Folder INBOX [acc: main]:
 Copy message UID 2 (2/49) main-remote:INBOX -&gt; main-local:INBOX
</pre>

Il ne reste plus maintenant qu&rsquo;à relancer la commande `mutt` pour visualiser ses mails.

<figure id="attachment_4413" style="width: 1024px" class="wp-caption alignnone"><img class="wp-image-4413 size-large" src="https://i1.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-29-08-56-33.jpg?resize=900%2C490&#038;ssl=1" alt="Mutt est maintenant configuré pour fonctionner avec ProtonMail" width="900" height="490" srcset="https://i1.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-29-08-56-33.jpg?resize=1024%2C557&ssl=1 1024w, https://i1.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-29-08-56-33.jpg?resize=300%2C163&ssl=1 300w, https://i1.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-29-08-56-33.jpg?resize=768%2C418&ssl=1 768w, https://i1.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-29-08-56-33.jpg?resize=668%2C364&ssl=1 668w, https://i1.wp.com/cedric.io/wp-content/uploads/2018/11/Capture-du-2018-11-29-08-56-33.jpg?w=1545&ssl=1 1545w" sizes="(max-width: 900px) 100vw, 900px" data-recalc-dims="1" /><figcaption class="wp-caption-text">L&rsquo;interface de Mutt une fois la configuration terminée</figcaption></figure>