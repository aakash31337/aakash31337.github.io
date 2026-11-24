# aakash31337 — blog

Live: **https://aakash31337.github.io**

Jekyll + Chirpy theme, build/deploy GitHub Actions se. Har `main` push pe site ~1 minute me update hoti hai.

---

## Series

Series = post ka **pehla category**. Alag se kuch register nahi karna:

```yaml
categories: [<Series Name>, <Sub Topic>]
```

Automatic banta hai:

- Sidebar me "Series" ke neeche ek menu item (post count ke saath)
- `/series/` — har series ek card, uske andar uske posts
- `/series/<slug>/` — ek series ka page, posts order me
- `/categories/<slug>/` — theme ka default category page

Description/order optional, `_data/series.yml` me:

```yaml
- name: <Series Name>
  description: <optional>
  order: <optional, chhota number pehle>
```

## Post likhna

1. `_posts/YYYY-MM-DD-title.md`
2. Front matter:

```yaml
---
title: <title>
date: 2026-12-01 20:00:00 +0530
categories: [<Series Name>, <Sub Topic>]
tags: [<tag>]
description: <one line>
---
```

3. `git add . && git commit -m "post" && git push`

`gh run list --limit 3` / `gh run watch` se build dekho.

**Note:** post ki date future ki nahi honi chahiye, warna Jekyll us post ko skip kar deta hai.

Front matter extras: `pin: true` (home pe top), `image:` (cover), `toc: false`, `math: true`.

Callout: `> text` + `{: .prompt-tip }` (`prompt-info`, `prompt-warning`, `prompt-danger`).

---

## Files

| File | Kaam |
|---|---|
| `assets/css/jekyll-theme-chirpy.scss` | design layer (colours, fonts, cards, sidebar) |
| `_includes/sidebar.html` | sidebar + series menu |
| `_layouts/series.html` | series page layout |
| `_tabs/series.md` | series card deck |
| `_plugins/series.rb` | series pages generate karta hai |
| `_data/series.yml` | optional series description/order |
| `assets/img/avatar.jpg` | sidebar logo |
| `assets/img/logo.jpg` | social preview |
| `assets/img/favicons/` | favicons |

Design tokens SCSS ke top me: bg `#080a11`, panel `#0d1019`, ink `#e9ebf4`, muted `#8d93a8`, cyan `#4cc9ff`, magenta `#f06ef2`. Fonts: Bricolage Grotesque, IBM Plex Sans, IBM Plex Mono.

## Local preview

```bash
docker run --rm -it -p 4000:4000 -v "$PWD":/srv/jekyll -w /srv/jekyll ruby:3.4 \
  bash -c "bundle install && bundle exec jekyll s --host 0.0.0.0"
```

Ruby 3.1+ ho to: `bundle install && bundle exec jekyll s`

## Deploy

`.github/workflows/pages-deploy.yml`: gems → `jekyll build` → htmlproofer (internal links) → GitHub Pages.
Fail ho to: `gh run view --log-failed`

PWA band hai (`pwa.enabled: false`) — wo deploy ke baad purana page dikhata tha; root ka `sw.min.js` purane visitors ka cache clear karta hai.
