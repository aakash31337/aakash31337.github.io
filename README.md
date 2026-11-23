# aakash31337 — blog

Live site: **https://aakash31337.github.io**
Repo: https://github.com/aakash31337/aakash31337.github.io

Jekyll + [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) theme. Build aur deploy GitHub Actions se hota hai — har `main` push pe site apne aap update ho jaati hai.

## Abhi site pe kya hai

- Logo: `assets/img/avatar.jpg` (sidebar) + `assets/img/logo.jpg` (social preview)
- Favicon: `assets/img/favicons/`
- Title/tagline: `aakash31337` / `Learn • Explore • Secure`
- Koi post nahi hai — jab aap likhoge tab aayenge
- Tabs: Categories, Tags, Archives (About page baad me add kar sakte hain)

Series structure abhi nahi banaya gaya hai, kyunki series ke naam/areas aap define karoge. Jab bataoge, main Series page + categories uske hisaab se bana dunga.

## Naya post likhna

1. `_posts/` me file banao: `YYYY-MM-DD-title.md`
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

3. Markdown likho, phir push:

```bash
git add . && git commit -m "post: title" && git push
```

4. 1-2 minute me live. Progress dekhne ke liye:

```bash
gh run list --limit 3
gh run watch
```

## Post ke extra options

| Front matter | Kaam |
|---|---|
| `pin: true` | Post home page pe sabse upar fix |
| `image: /assets/img/x.png` | Cover image |
| `toc: false` | Table of contents off |
| `math: true` | Math formulas on |
| `comments: false` | Us post pe comments off (global default already off) |

Callouts:

```markdown
> Ye ek tip hai.
{: .prompt-tip }
```

`prompt-tip`, `prompt-info`, `prompt-warning`, `prompt-danger` — chaaron chalte hain.

## Site settings (`_config.yml`)

- `title`, `tagline`, `description` — branding
- `avatar` — sidebar ka logo
- `social_preview_image` — WhatsApp/Twitter pe link share karne pe dikhne wali image
- `theme_mode: dark` — default dark mode
- `comments.provider` — Giscus/Utterances on karna ho to
- `analytics` — Google Analytics / GoatCounter
- `social.links` — Twitter, LinkedIn add karna ho to

Sidebar icons `_data/contact.yml` me hain (abhi GitHub + RSS). Email public site pe nahi hai.

## Logo badalna

- Sidebar logo: `assets/img/avatar.jpg` replace karo (square, 512x512 best)
- Social preview: `assets/img/logo.jpg` replace karo (1200x800 / 3:2 best)
- Favicon: `assets/img/favicons/` me saari files replace karo (96x96, 180x180, 192x192, 512x512, .ico, .svg)

## Local preview (optional)

Ruby 3.1+ chahiye:

```bash
bundle install
bundle exec jekyll s
# http://127.0.0.1:4000
```

Docker se:

```bash
docker run --rm -it -p 4000:4000 -v "$PWD":/srv/jekyll -w /srv/jekyll ruby:3.4 \
  bash -c "bundle install && bundle exec jekyll s --host 0.0.0.0"
```

## Deploy pipeline

`.github/workflows/pages-deploy.yml`:

1. Ruby 3.4 + gems install
2. `jekyll build` → `_site`
3. `htmlproofer` — internal links aur images check (external skip)
4. Artifact upload → GitHub Pages deploy

Build fail ho to: `gh run view --log-failed`

## Repo files

```text
_config.yml           site config
_posts/               blog posts (abhi khaali)
_tabs/                Categories, Tags, Archives pages
_data/contact.yml     sidebar ke social icons
assets/img/           logo, avatar, favicons
.github/workflows/    build + deploy
```
