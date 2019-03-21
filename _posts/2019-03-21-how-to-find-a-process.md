---
layout: micropubpost
date: '2019-03-21T09:47:39.881Z'
title: How to find a Process ID listening to a specific TCP port
tags: command line
slug: how-to-find-a-process
lang: en
---
Let's say I want to find every process listening to TCP prot 11620 :   


    sudo lsof -i tcp:11620

The command returns :   


    COMMAND  PID USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
        
    
      bundle  4802 root   14u  IPv4 1780507      0t0  TCP *:11620 (LISTEN)
        
    
      bundle  4849 root   14u  IPv4 1780507      0t0  TCP *:11620 (LISTEN)
        
    
      bundle  4854 root   14u  IPv4 1780507      0t0  TCP *:11620 (LISTEN)
        
    
      bundle  4859 root   14u  IPv4 1780507      0t0  TCP *:11620 (LISTEN)
        
    
      bundle  4864 root   14u  IPv4 1780507      0t0  TCP *:11620 (LISTEN)
