---
layout: post
title: Première semaine avec Vim
date: 2019-03-18 16:09 +0100
tags: vim
mf-syndicate-to:
  - 'https://brid.gy/publish/twitter'
---

Ce lundi marque la fin de ma première semaine d'utilisation exclusive de [Vim](https://www.vim.org). Cela faisait des années que j'avais l'intention de m'y mettre sérieusement, mais lors de chaque tentative, je me trouvais une excuse pour abandonner rapidement.

Cette fois-ci fut différente. Alors que je n'avais jamais trouvé un IDE avec lequel je pouvais m'engager au long terme (à l'exception de [Sublime Text](https://www.sublimetext.com/) vers lequel je revenais sans cesse), ma découverte récente d'[i3](https://i3wm.org/) m'a donné envie de me passer de plus en plus de ma souris, ce qui m'a donné la motivation nécessaire pour tenter une nouvelle fois l'expérience.

Bien sûr, je n'étais pas complètement novice : ces dix dernières années, j'ai utilisé Vim régulièrement que ça soit pour éditer les fichiers de configuration d'un serveur ou encore rédiger mes commit messages. J'ai quelques raccourcis de base en tête, et la navigation avec les touches `h`, `j`, `k`, `l` ne m'était pas complètement inconnue. En vérité, je trouve l'utilisation de ces 4 touches tellement efficace que j'ai téléchargé [vim vixen](https://addons.mozilla.org/en-US/firefox/addon/vim-vixen/) pour Firefox et modifié mon mapping i3 pour correspondre à ce type de navigation.

## Etat des lieux

En me basant sur la configuration proposée par [Luke Smith](https://lukesmith.xyz/) dans [LARBS](https://larbs.xyz/), j'y ai ajouté quelques touches personnelles :

* [leafgarland/typescript-vim](https://github.com/leafgarland/typescript-vim) et [kchmck vim coffee script](khttps://github.com/kchmck/vim-coffee-script) respectivement pour TypeScript et CoffeScript
* [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter) affiche l'état du `git diff` ligne par ligne;
* [ctrlpvim/ctrlp-vim](https://github.com/ctrlpvim/ctrlp.vim) pour naviguer facilement entre les différents fichiers d'un projet (le nom fait évidemment référence à la fonctionnalité `Ctrl+p` disponible notamment avec Sublime Text et VSCode;
* [FelikZ/ctrlp-py-matcher](https://github.com/FelikZ/ctrlp-py-matcher) : un matcher pour CtrlP bien plus rapide que l'original - original qui était tellement lent qu'il a failli me servir d'excuser pour abandonner cette fois-ci. Merci [Renato](https://lond.com.br/) pour la suggestion.

Additionnellement, j'ai appliqué d'autres modifications :

```
set undodir=~/.vim/undodir
set undofile
```

Cette configuration permet de sauvegarder l'état du `undo`, rendant possible le fait de quitter Vim, d'ouvrir le fichier/projet plus tard, et d'être toujours en mesure de revenir en arrière dans mes modifications.

```
" enable pymatcher for ctrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" map ff to CtrlP
map ff :CtrlP<.><cr>

" CtrlP cache persistance
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" use ag to scan for file (much faster than globpath()
" source : https://stackoverflow.com/a/22784889
" must install the_silver_searcher

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" ignored files/paths for CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
```

Le bloc ci-dessus concerne CtrlP.

* La première ligne active `ctrlp-py-matcher`;
* La deuxième active le raccourci (en mode normal) `ff` vers `:CtrlP`;
* Les lignes suivantes sont des optimisations glannée ça et là sur StackOverflow pour optimiser la vitesse du plugin.

## Conclusion de cette première semaine

* Je n'ai pas l'impression d'avoir perdu en productivité. Bien sûr, il y a la frustration occasionnelle d'avoir oublié tel ou tel raccourcis, ou encore celle de se rendre compte de la quantité de connaissance que l'on a pas encore, mais globalement ce ralentissement n'est pas plus important que celui que l'on expérimente en retirant sans main droite du clavier pour atteindre la souris et chercher le menu correspondant à l'action désirée;
* La navigation `hjkl` est bien plus confortable que ce que je ne m'imaginais. Surtout lorsqu'elle est disponible quasiment partout dans le système d'exploitation (merci LARBS);
* [Vim pour les Humains](https://vimebook.com/fr) est une excellente introduction, en français, et a prix libre;
* J'ai la nette sensation que, _cette fois, c'est la bonne_!
