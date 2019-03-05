---
layout: default
---
{% for read in site.reads reversed %}
  <div class="entry-content e-content p-summary entry-title p-name" itemprop="name headline description articleBody">
            
    <section class="response u-read-of h-cite">
      <strong>{{ read.date | date_to_long_string }}</strong>
      <header>
        <span class="kind-display-text">Read</span>
        <a href="{{ read.uri }}" class="p-name u-url"> 
          {{ read.title }}
        </a> 
        by 
        <a href="{{ read.author.uri }}" class="h-card p-author">
          <img class="u-photo jetpack-lazy-image jetpack-lazy-image--handled" src="{{ read.author.picture }}" alt="{{ read.author.name }}" data-recalc-dims="1" data-lazy-loaded="1" width="32" height="32">
          {{ read.author.name }}
        </a>
      </header>
    </section>

  </div>
{% endfor %}