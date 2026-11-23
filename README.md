# 0xNotes — personal blog

Live site: **https://aakash31337.github.io**

Jekyll + [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) theme, build aur deploy GitHub Actions se hota hai. Har `main` branch push pe site automatically update ho jaati hai.

## Naya post likhna (90% kaam yahi hai)

1. `_posts/` folder me file banao. Naam ka format: `YYYY-MM-DD-kuch-bhi.md`
   Example: `_posts/2026-12-01-ssrf-in-image-proxy.md`
2. File ke sabse upar ye block daalo:

```yaml
---
title: SSRF in an image proxy
date: 2026-12-01 20:00:00 +0530
categories: [Web Security]
tags: [ssrf, recon]
description: One line summary jo home page aur Google pe dikhegi.
---
```

3. Neeche normal Markdown likho. Save karo, phir:

```bash
git add .
git commit -m "post: ssrf in image proxy"
git push
```

4. 1-2 minute me Actions build karega aur post live ho jaayega. Progress dekhne ke liye:

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

Callouts Markdown me aise:

```markdown
> Ye ek tip hai.
{: .prompt-tip }
```

`prompt-tip`, `prompt-info`, `prompt-warning`, `prompt-danger` — chaaron chalte hain.

## Site settings

Sab kuch `_config.yml` me hai:

- `title`, `tagline`, `description` — branding
- `avatar` — sidebar ki photo (`assets/img/avatar.png`)
- `theme_mode: dark` — default dark mode
- `comments.provider` — Giscus/Utterances on karna ho to
- `analytics` — Google Analytics / GoatCounter
- `social.links` — Twitter, LinkedIn add karna ho to

Tabs (About/Archives/Categories/Tags) `_tabs/` folder me hain. About page edit karne ke liye `_tabs/about.md`.

## Local preview (optional)

Ruby 3.1+ chahiye:

```bash
bundle install
bundle exec jekyll s
# http://127.0.0.1:4000
```

Docker se bhi chal sakta hai:

```bash
docker run --rm -it -p 4000:4000 -v "$PWD":/srv/jekyll -w /srv/jekyll ruby:3.4 \
  bash -c "bundle install && bundle exec jekyll s --host 0.0.0.0"
```

## Deploy pipeline

`.github/workflows/pages-deploy.yml`:

1. Ruby 3.4 + gems install
2. `jekyll build` → `_site`
3. `htmlproofer` — internal links aur images check (external links skip)
4. Artifact upload → GitHub Pages deploy

Agar build fail ho to `gh run view --log-failed` se error dekho.

## Repo files

```text
_config.yml           site config
_posts/               blog posts
_tabs/                About, Archives, Categories, Tags pages
_data/contact.yml     sidebar ke social icons
_data/share.yml       post ke share buttons
assets/img/           images
.github/workflows/    build + deploy
```
