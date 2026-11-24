---
title: Series
icon: fas fa-layer-group
order: 1
---

Posts are grouped into series. A series is the first category of a post, so nothing has to be registered anywhere: publishing a post with `categories: [Series Name]` creates the series and its menu entry.

{% assign series_pages = site.pages | where: "layout", "series" | sort: "series_rank" %}

{% if series_pages.size > 0 %}
<ul class="series-index">
  {% for series in series_pages %}
  <li class="series-index-item">
    <a class="series-index-title" href="{{ series.url | relative_url }}">{{ series.title }}</a>
    <p class="series-index-desc">
      {% if series.series_description %}{{ series.series_description }}{% else %}Read in order, oldest first.{% endif %}
    </p>
    <p class="series-index-meta">{{ series.posts.size }} post{% if series.posts.size != 1 %}s{% endif %}</p>
  </li>
  {% endfor %}
</ul>
{% else %}
<p class="series-empty">No series yet. Publish a post with a first category, for example <code>categories: [Web Security, SSRF]</code>, and it will appear here and in the sidebar.</p>
{% endif %}
