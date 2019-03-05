---
id: 9
title: Configure a triple monitor on a Lenovo T420s with xrandr
date: 2016-08-24 09:29:42.000000000 +00:00
author: cedric
layout: post


guid: https://cedric.io/2016/08/24/configure-a-triple-monitor-on-a-lenovo-t420s-with-xrandr.html
permalink: "/2016/08/24/configure-a-triple-monitor-on-a-lenovo-t420s-with-xrandr/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '277'
categories:
- Non classé
---
This is more a personal note than a real post. I just struggled for 4 hours to have my 2+1 screen to work just fine.

Here’s my secret :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>xrandr --fb 4160x1024 --output LVDS-1 --mode 1600x900 --pos 2560x120 
xrandr --fb 4160x1024 --output VGA-1 --mode 1280x1024 --pos 1280x0 
xrandr --fb 4160x1024 --output DP-3 --mode 1280x1024 --pos 0x0
</code></pre>
  </div>
</div>