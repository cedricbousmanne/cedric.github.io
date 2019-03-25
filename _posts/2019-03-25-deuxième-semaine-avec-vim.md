---
layout: post
title: Deuxième semaine avec Vim
date: 2019-03-25 13:40 +0100
tags: vim
mf-syndicate-to:
  - 'https://brid.gy/publish/twitter'
---

Cette deuxième semaine a été moins prolifique que [la première](/2019/03/18/première-semaine-avec-vim.html). J'ai gagné en assurance et acquis de meilleurs reflexes, mais rien d'aussi probant que lors de la première découverte.

Ceci dit, la navigation Vim `hjkl` devient une seconde nature. Je me suis surpris à vouloir l'utiliser dans d'[autres circonstance](/social/2019/03/21/55261.html) malgré moi. J'ai beaucoup à apprendre en terme d'optimisation, mais l'utilisation des touches de bases est confortable.

J'ai également remappé l'utilisation de la virgule : `,,` fait désormais office de `ESC` me permettant ainsi de moins bouger mes mains pour passer du mode insertion au mode normal.

Côté plugins, j'ai installé [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) pour l'autocomplétion du code et [fzf](https://github.com/junegunn/fzf.vim) pour la recherche globale.

## YouCompleteMe

Mapping de `,gt` et `,gd` respectivement vers les fonctions `GoTo` et `GoToDefinition`

```
 nnoremap <leader>gt :YcmCompleter GoTo<CR>
 nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
 ```

 ## Difficultés actuelles

 J'éprouve toujours des difficultés lorsqu'il s'agit de copier(yank)/coller(put) du texte dans vim :

 - De vim vers vim, la difficulté principale réside dans la précision : l'endroit ou le texte va être effectivement collé (avant ou après le curseur) n'est pas encore clair pour moi
 - Depuis vim vers l'extérieur, de l'extérieur vers vim : l'utilisation hybride de `yy`/`p` et `CTRL+c`/`CTRL+v` me semble parfois ne pas fonctionner comme il faudrait.

## Lectures intéressantes

* [Working with Vim](https://mkaz.blog/code/working-with-vim/)
* [Getting Productive with Vim in a Week without Hating It](https://nickjanetakis.com/blog/getting-productive-with-vim-in-a-week-without-hating-it)
