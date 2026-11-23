---
title: How this blog is built
date: 2026-11-23 11:30:00 +0530
categories: [Meta]
tags: [jekyll, github-pages, ci-cd]
description: Chirpy theme, GitHub Actions build, aur naya post likhne ka poora process.
---

Site [Jekyll](https://jekyllrb.com/) pe chalti hai, theme [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) hai, aur build GitHub Actions karta hai — GitHub ke built-in Jekyll builder se nahi.

## Structure

```text
.
├── _config.yml        # site ka poora config (title, url, avatar, tabs)
├── _posts/            # blog posts (markdown)
├── _tabs/             # About / Archives / Categories / Tags pages
├── assets/img/        # images (avatar yahan hai)
└── .github/workflows/ # build + deploy pipeline
```

## Naya post likhna

1. `_posts/` me file banao — naam ka format: `YYYY-MM-DD-title.md`
2. Upar front matter daalo:

```yaml
---
title: My new post
date: 2026-11-24 10:00:00 +0530
categories: [Web Security]
tags: [ssrf, recon]
description: One line summary for SEO and the post list.
---
```

3. Markdown me content likho, `git push` karo. Actions khud build karke site update kar dega — 1-2 minute.

## Local preview (optional)

Local Ruby 3.1+ chahiye:

```bash
bundle install
bundle exec jekyll s
```

Sirf browser me dekhna ho to push karke live site check karna sabse aasan hai.

## Handy front matter

| Field | Kaam |
|-------|------|
| `pin: true` | Post home page pe top pe chipak jaata hai |
| `image: path` | Post ke top pe cover image |
| `toc: false` | Right side ka table of contents band |
| `comments: false` | Us post pe comments band (default hi off hai) |
| `math: true` | MathJax formulas enable |

> Config me comments, analytics, PWA sab already wired hai — bas `_config.yml` me value bhar dena.
{: .prompt-info }
