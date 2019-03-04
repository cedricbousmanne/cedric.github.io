---
id: 4464
title: Dériver le courrier email sortant vers Mailgun
date: 2018-12-13T12:09:32+00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4464
permalink: /2018/12/13/deriver-mail-postfix-mailgun/
mf2_mp-syndicate-to:
  - 'a:1:{i:0;s:22:"bridgy-publish_twitter";}'
mastoshare-post-status:
  - 'off'
mastoshareshare-lastSuccessfullTootURL:
  - https://ruby.social/@akyrho/101233418236908334
geo_weather:
  - 'a:2:{s:5:"units";s:1:"C";s:4:"icon";s:4:"none";}'
geo_public:
  - "0"
mf2_syndication:
  - 'a:2:{i:0;s:53:"https://twitter.com/akyrho/status/1073173118460547073";i:1;s:46:"https://ruby.social/@akyrho/101233418236908334";}'
  - 'a:2:{i:0;s:53:"https://twitter.com/akyrho/status/1073173118460547073";i:1;s:46:"https://ruby.social/@akyrho/101233418236908334";}'
categories:
  - Non classé
tags:
  - mail
  - mailgun
  - postfix
kind:
  - Note
---
Source : <https://www.digitalocean.com/community/tutorials/how-to-set-up-a-mail-relay-with-postfix-and-mailgun-on-ubuntu-16-04>

TL;DR

<pre>sudo debconf-set-selections &lt;&lt;&lt; "postfix postfix/main_mailer_type select Satellite system"
sudo debconf-set-selections &lt;&lt;&lt; "postfix postfix/mailname string $HOSTNAME"
sudo debconf-set-selections &lt;&lt;&lt; "postfix postfix/relayhost string smtp.mailgun.org"
sudo apt -y install postfix
sudo nano /etc/postfix/sasl_passwd</pre>

Ajouter la ligne suivante :

<pre>smtp.mailgun.org your_mailgun_smtp_user@your_subdomain_for_mailgun:your_mailgun_smtp_password</pre>

<pre>sudo chmod 600 /etc/postfix/sasl_passwd
sudo postmap /etc/postfix/sasl_passwd
sudo nano /etc/postfix/main.cf</pre>

En fin de fichier, ajouter :

<pre>smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous
smtp_sasl_mechanism_filter = AUTH LOGIN</pre>

Modifier également la ligne `relayhost` :

<pre>relayhost = smtp.mailgun.org</pre>

<pre>sudo systemctl restart postfix
sudo ufw status
php -r "mail('youremail@gmail.com', 'test', 'test');"</pre>

Pour terminer, on célèbre la victoire 🎉