---
title: Series
icon: fas fa-layer-group
order: 1
---

The blog is organised as series. Each series follows one area from the basics to the parts that actually take time, and posts inside a series are meant to be read in order.

{% for series in site.data.series %}
  {% assign posts = site.categories[series.category] %}
  {% if posts %}{% assign posts = posts | sort: "date" %}{% endif %}
  <h2 id="{{ series.category | slugify }}">{{ series.name }}</h2>
  <p>{{ series.description }}</p>
  {% if posts and posts.size > 0 %}
  <ol>
    {% for post in posts %}
    <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a>{% if post.description %} — {{ post.description }}{% endif %}</li>
    {% endfor %}
  </ol>
  {% else %}
  <p><em>No posts published yet — this series is being written.</em></p>
  {% endif %}
{% endfor %}

> Every post is tagged with its series, so the same list is also available from the [Categories](/categories/) page.
{: .prompt-info }
