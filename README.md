# aakash31337 — blog

Live: **https://aakash31337.github.io**
Repo: https://github.com/aakash31337/aakash31337.github.io

Jekyll + Chirpy theme, build aur deploy GitHub Actions se. Har `main` push pe site ~1 minute me update ho jaati hai.

---

## Series kaise kaam karta hai

Series banane ke liye kuch register nahi karna. Post ke front matter me **pehla category hi series hai**:

```yaml
categories: [Web Security, SSRF]
#            ^ series      ^ sub-topic
```

Isse apne aap ye ban jaata hai:

- Sidebar me **Series** ke neeche ek naya menu item (post count ke saath)
- Ek page: `/series/web-security/` — us series ke saare posts padhne ke order me (purana pehle), numbering ke saath
- `/series/` page pe saari series ki list
- Category page `/categories/web-security/` (theme ka default)

Doosra post usi series me daalne ke liye same first category use karo — menu ka count badh jaayega.

### Series ki description aur order (optional)

`_data/series.yml` me entry daalo:

```yaml
- name: Web Security
  description: Deep dives into vulnerability classes.
  order: 1
```

`name` post ke first category se exactly match hona chahiye. `order` chhota number = menu me pehle. Entry na ho to bhi series ban jaati hai (oldest post ke hisaab se order).

---

## Naya post likhna

1. `_posts/` me file: `YYYY-MM-DD-title.md`
2. Front matter:

```yaml
---
title: Post title
date: 2026-12-01 20:00:00 +0530
categories: [Series Name, Sub Topic]
tags: [tag-one, tag-two]
description: One line summary for search results and the post list.
---
```

3. Push:

```bash
git add . && git commit -m "post: title" && git push
```

Build dekhne ke liye: `gh run list --limit 3` / `gh run watch`

**Dhyan rakho:** post ki `date` future me nahi honi chahiye, warna Jekyll us post ko build me skip kar deta hai.

## Post ke extra options

| Front matter | Kaam |
|---|---|
| `pin: true` | Post home page pe sabse upar |
| `image: /assets/img/x.png` | Cover image |
| `toc: false` | Table of contents off |
| `math: true` | Math formulas on |

Callouts: `> text` + `{: .prompt-tip }` (ya `prompt-info`, `prompt-warning`, `prompt-danger`)

---

## Theme / design

Chirpy ke upar ek custom design layer hai:

| File | Kya karta hai |
|---|---|
| `assets/css/jekyll-theme-chirpy.scss` | poori styling: colours, fonts, sidebar, post list, series pages |
| `_includes/sidebar.html` | sidebar + Series menu |
| `_layouts/home.html` | home post list + empty state |
| `_layouts/series.html` | series page ka layout |
| `_plugins/series.rb` | series pages generate karta hai |

Design tokens (SCSS ke top me):

- Background `#080a11`, panels `#0d1019`, text `#e9ebf4`, muted `#8d93a8`
- Accents: cyan `#4cc9ff`, magenta `#f06ef2` (logo se liye)
- Fonts: Bricolage Grotesque (headings), IBM Plex Sans (body), IBM Plex Mono (code/meta)

Logo files:

- Sidebar: `assets/img/avatar.jpg`
- Social preview: `assets/img/logo.jpg`
- Favicon: `assets/img/favicons/`

---

## Local preview (optional)

Ruby 3.1+ chahiye:

```bash
bundle install
bundle exec jekyll s
```

Docker se:

```bash
docker run --rm -it -p 4000:4000 -v "$PWD":/srv/jekyll -w /srv/jekyll ruby:3.4 \
  bash -c "bundle install && bundle exec jekyll s --host 0.0.0.0"
```

## Deploy pipeline

`.github/workflows/pages-deploy.yml` — Ruby 3.4 + gems → `jekyll build` → htmlproofer (internal links) → GitHub Pages deploy.
Fail ho to: `gh run view --log-failed`

## Note

PWA service worker band hai (`pwa.enabled: false`) — wo har deploy ke baad purana page dikhata tha. Root ka `sw.min.js` purane visitors ka cache saaf karta hai.
