---
id: 4495
title: Cleanup old git branches
date: 2018-12-20 17:09:47.000000000 +00:00
author: cedric
layout: post
guid: https://cedric.io/?p=4495
permalink: "/2018/12/20/clean-old-git-branches/"
mastoshare-post-status:
- 'off'
mastoshareshare-lastSuccessfullTootURL:
- https://ruby.social/@akyrho/101274235011407028
mf2_mp-syndicate-to:
- bridgy-publish_twitter
geo_weather:
  units: C
  icon: none
geo_public:
- '0'
mf2_syndication:
- https://twitter.com/akyrho/status/1075785971235467264
- https://ruby.social/@akyrho/101274235011407028
- https://www.linkedin.com/feed/update/urn:li:activity:6481551471186833408
- https://twitter.com/akyrho/status/1075785674010320897
categories:
- web
tags:
- git
kind:
- Note
---
Yesterday I had to clean some very old branches on a project&rsquo;s codebase. Here&rsquo;s a few git tricks I had to use.

List merged branch (excluding master and staging) :

<pre>git branch --merged | egrep -v "(^\*|master|staging)"</pre>

Delete them locally :

<pre>git branch --merged | egrep -v "(^\*|master|staging)" | xargs -n 1 git branch -d</pre>

Delete them remotely :

<pre>git branch -r --merged | grep -v "origin/master$" | grep -v "origin/staging$" | sed 's/\s*origin\///' | xargs -n 1 git push --delete origin
</pre>

<pre>git remote prune origin</pre>

Source : <https://stackoverflow.com/questions/6127328/how-can-i-delete-all-git-branches-which-have-been-merged>

Display branches with oldest commit datetime :

<pre>for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r</pre>