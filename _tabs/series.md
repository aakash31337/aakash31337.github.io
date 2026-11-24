---
title: Series
icon: fas fa-layer-group
order: 1
---

{% assign series_pages = site.pages | where: "layout", "series" | sort: "series_rank" %}

<div class="series-deck">
  {% for series in series_pages %}
  <article class="series-card">
    <div class="series-card-head">
      <a class="series-card-title" href="{{ series.url | relative_url }}">{{ series.title }}</a>
      <span class="series-card-count">{{ series.posts.size }}</span>
    </div>
    <ol class="series-card-posts">
      {% for post in series.posts %}
      <li class="series-card-post">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%b %-d" }}</time>
      </li>
      {% endfor %}
    </ol>
  </article>
  {% endfor %}
</div>
