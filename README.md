# 0xNotes — personal blog

Live site: **https://aakash31337.github.io**

Jekyll + [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) theme. Build aur deploy GitHub Actions se hota hai — har `main` push pe site apne aap update ho jaati hai.

## Blog ka structure: series

Blog random posts ka collection nahi, **series** me chalta hai. Har series ek area cover karti hai aur posts usi order me padhne ke liye hain.

Series list `_data/series.yml` me hai (Series page isi file se banti hai). Abhi ye series defined hain:

| Series | Category value |
|---|---|
| Start Here | `Start Here` |
| Bug Bounty | `Bug Bounty` |
| Web Security | `Web Security` |
| Reverse Engineering | `Reverse Engineering` |
| AI Security | `AI Security` |

Nayi series add karni ho to `_data/series.yml` me ek entry daal do — Series page khud update ho jaayega.

## Naya post likhna

1. `_posts/` me file banao: `YYYY-MM-DD-title.md`
   Example: `_posts/2026-12-01-ssrf-in-image-proxy.md`
2. Upar front matter — **pehla category hi series hai**:

```yaml
---
title: SSRF in an image proxy
date: 2026-12-01 20:00:00 +0530
categories: [Web Security, SSRF]   # [series, sub-topic]
tags: [ssrf, recon]
description: One line summary jo home page aur Google pe dikhegi.
---
```

3. Neeche Markdown likho, phir push:

```bash
git add . && git commit -m "post: ssrf in image proxy" && git push
```

4. 1-2 minute me live. Progress:

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

## Site settings

Sab `_config.yml` me:

- `title`, `tagline`, `description` — branding
- `avatar` — sidebar ki photo (`assets/img/avatar.png`)
- `theme_mode: dark` — default dark mode
- `comments.provider` — Giscus/Utterances on karna ho to
- `analytics` — Google Analytics / GoatCounter
- `social.links` — Twitter, LinkedIn add karna ho to

Sidebar ke icons `_data/contact.yml` me hain (abhi GitHub + RSS). Email jaan-boojh kar hataya gaya hai — public site pe nahi chahiye.

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
_data/series.yml      series list (Series page ka source)
_data/contact.yml     sidebar ke social icons
_posts/               blog posts
_tabs/                Series, Categories, Tags, Archives, About pages
assets/img/           images
.github/workflows/    build + deploy
```
