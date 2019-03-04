---
id: 4207
title: Identifier une régression grâce à git-bisect
date: 2018-10-26T09:38:12+00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4207
permalink: /2018/10/26/identifier-une-regression-grace-a-git-bisect/
mf2_mp-syndicate-to:
  - 'a:1:{i:0;s:22:"bridgy-publish_twitter";}'
mf2_syndication:
  - 'a:4:{i:0;s:99:"https://medium.com/@akyrho/identifier-une-r%C3%A9gression-gr%C3%A2ce-%C3%A0-git-bisect-16656bdd65c5";i:1;s:53:"https://twitter.com/akyrho/status/1055725309302112256";i:2;s:46:"https://ruby.social/@akyrho/100960796353516224";i:3;s:73:"https://www.linkedin.com/feed/update/urn:li:activity:6468758810809946112/";}'
  - 'a:4:{i:0;s:99:"https://medium.com/@akyrho/identifier-une-r%C3%A9gression-gr%C3%A2ce-%C3%A0-git-bisect-16656bdd65c5";i:1;s:53:"https://twitter.com/akyrho/status/1055725309302112256";i:2;s:46:"https://ruby.social/@akyrho/100960796353516224";i:3;s:73:"https://www.linkedin.com/feed/update/urn:li:activity:6468758810809946112/";}'
geo_weather:
  - 'a:2:{s:5:"units";s:1:"C";s:4:"icon";s:4:"none";}'
geo_public:
  - "1"
snap_isAutoPosted:
  - "1540539493"
mastoshare-post-status:
  - 'off'
mastoshareshare-lastSuccessfullTootURL:
  - https://ruby.social/@akyrho/100960796353516224
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snapMD:
  - |
    s:384:"a:1:{i:0;a:10:{s:2:"do";s:1:"1";s:10:"msgTFormat";s:7:"%TITLE%";s:9:"msgFormat";s:19:"%FULLTEXT%
    
    %URL%";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:4:"doMD";i:0;s:8:"isPosted";s:1:"1";s:4:"pgID";s:12:"16656bdd65c5";s:7:"postURL";s:99:"https://medium.com/@akyrho/identifier-une-r%C3%A9gression-gr%C3%A2ce-%C3%A0-git-bisect-16656bdd65c5";s:5:"pDate";s:19:"2018-10-26 07:39:23";}}";
snapTW:
  - 's:213:"a:1:{i:0;a:8:{s:2:"do";s:1:"0";s:9:"msgFormat";s:26:"%TITLE%. %EXCERPT% - %URL%";s:8:"attchImg";s:1:"1";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:4:"doTW";i:0;}}";'
categories:
  - Non classé
tags:
  - git
  - programming
kind:
  - Article
---
Enfer et damnation, vous venez de constater un bug dans votre code. Évidemment, il est difficile de savoir à quel moment cette régression est apparue et en trouver l&rsquo;origine pourrait nous permettre de comprendre et donc de résoudre le bug.

Heureusement, `<a href="https://git-scm.com/docs/git-bisect" target="_blank" rel="noopener">git-bisect</a>` vient à votre secours, pour peu de savoir l&rsquo;utiliser.

On commence donc par signifier à git que nous sommes dans un état « mauvais » du code :

<pre>git bisect bad

Vous devez démarrer avec "git bisect start"
Souhaitez-vous que je le fasse pour vous [Y/n] ? y</pre>

Il faut maintenant remonter suffisamment longtemps dans l&rsquo;historique dans l&rsquo;objectif de trouver l&rsquo;état du code ou la régression constatée n&rsquo;existait pas. Un petit `git log` devrait suffire à identifier le commit-id correspondant.

<pre>git checkout &lt;commit-id&gt;</pre>

Après avoir vérifié que la régression n&rsquo;existait pas dans cet état du code, on signifie à `git-bisect` qu&rsquo;on a une sous la main une version du code correcte.

<pre>git bisect good
Bissection : 132 révisions à tester après cette (à peu près 7 étapes)
[&lt;commit-id&gt;] &lt;commit-message&gt;
</pre>

En retour, `git-bisect` nous donne le nombre de révisions à tester (ici : 132), et le nombre d&rsquo;étapes estimées avant d&rsquo;obtenir le nom du coupable (ici : 7). Enfin, `git-bisect` à effectué un checkout automatique sur un autre `<commit-id>` et attend vos instructions.

Il ne reste qu&rsquo;a tester le code et à donner comme instruction soit un `git bisect good`, soit un `git bisect bad` en fonction du résultat observé. L&rsquo;opération sera plus ou moins longue en fonction du nombre de commits à tester.

<pre>➜  webapp git:(6ae90d246) git bisect good
Bissection : 132 révisions à tester après cette (à peu près 7 étapes)
[49cbe40d5cb63b9f2a036560190983b2848d6df0] Merge branch 'master' into deploy/staging
➜  webapp git:(49cbe40d5) ✗ git bisect good
Bissection : 66 révisions à tester après cette (à peu près 6 étapes)
[dc9c093633ca9af720ae560b01ff455d4bd4fb51] &lt;commit-message&gt;
➜  webapp git:(dc9c09363) ✗ git bisect good
Bissection : 33 révisions à tester après cette (à peu près 5 étapes)
[4f8b4fd5f7ecb71141510823e89f3d941f6d892b] &lt;commit-message&gt;
➜  webapp git:(4f8b4fd5f) git bisect bad                                       
Bissection : 16 révisions à tester après cette (à peu près 4 étapes)
[0e5acfb262de5f692f8383cd51fe5c4bed729b92] &lt;commit-message&gt;
➜  webapp git:(0e5acfb26) git bisect good
Bissection : 7 révisions à tester après cette (à peu près 3 étapes)
[7623848ffee8d72429623e3b5fb8fb1a8040aeed] &lt;commit-message&gt;
➜  webapp git:(7623848ff) ✗ git bisect good
Bissection : 4 révisions à tester après cette (à peu près 2 étapes)
[50f6b9ebf42ff5cda83d33d4489e944829f87c56] &lt;commit-message&gt;
➜  webapp git:(50f6b9ebf) ✗ git bisect good
Bissection : 2 révisions à tester après cette (à peu près 1 étape)
[d763c0336e13cbc91befbe853194dd077775e6cd] &lt;commit-message&gt;
➜  webapp git:(d763c0336) git bisect good
Bissection : 0 révision à tester après cette (à peu près 1 étape)
[c1af98fc24e031d0d87a567caa7615c0c2c3d66c] &lt;commit-message&gt;
➜  webapp git:(c1af98fc2) git bisect bad 
Bissection : 0 révision à tester après cette (à peu près 0 étape)
[026f9bf37555815c0efc9dfb16e90473faacf48f] &lt;commit-message&gt;

</pre>

Une fois la dernière étape passé, `git-bisect` vous donne l&rsquo;identité du coupable :

<pre>git bisect bad
026f9bf37555815c0efc9dfb16e90473faacf48f is the first bad commit
</pre>

Pour terminer, nous pouvons revenir à l&rsquo;état initial du code (`HEAD`)

<pre>git bisect reset</pre>