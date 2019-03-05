---
id: 561
title: How to install mysql2 gem on Mac OS Mavericks (10.9)
date: 2013-10-28 11:01:43.000000000 +00:00
author: cedric
layout: post

guid: https://cedric.io/2013/10/28/how-to-install-mysql2-gem-on-mac-os-mavericks-10-9.html
permalink: "/2013/10/28/how-to-install-mysql2-gem-on-mac-os-mavericks-10-9/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '799'
categories:
- Non classé
---
Today, i spent way too much time to install the mysql2 gem. Here’s the command that worked fine

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>ARCHFLAGS="-arch x86_64" gem install mysql2 -v '0.3.11' -- \ --with-mysql-config=/usr/local/bin/mysql_config

</code></pre>
  </div>
</div>