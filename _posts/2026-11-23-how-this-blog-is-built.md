---
title: How this blog is built
date: 2026-11-23 11:30:00 +0530
categories: [Start Here]
tags: [jekyll, github-pages, ci-cd]
description: Chirpy theme, GitHub Actions build, and the exact steps for publishing a new post.
---

The site runs on [Jekyll](https://jekyllrb.com/) with the [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) theme, and GitHub Actions does the build and deploy.

## Repository layout

```text
.
├── _config.yml        # site settings (title, url, avatar, tabs)
├── _data/series.yml   # the series list shown on the Series page
├── _posts/            # posts (markdown)
├── _tabs/             # Series / Categories / Tags / Archives / About pages
├── assets/img/        # images
└── .github/workflows/ # build + deploy pipeline
```

## Writing a post

1. Create a file in `_posts/` named `YYYY-MM-DD-title.md`.
2. Add the front matter:

```yaml
---
title: My new post
date: 2026-11-24 10:00:00 +0530
categories: [Web Security, SSRF]   # first category = series
tags: [ssrf, recon]
description: One line summary for search results and the post list.
---
```

3. Write the content in Markdown, then commit and push. The pipeline rebuilds the site in about a minute.

The **first category is the series**, the rest are sub-topics. A post with `categories: [Bug Bounty, Recon]` shows up under the Bug Bounty series and under the Recon sub-category.

## Useful front matter

| Field | Effect |
|-------|--------|
| `pin: true` | Sticks the post to the top of the home page |
| `image: /assets/img/x.png` | Cover image |
| `toc: false` | Hides the table of contents |
| `math: true` | Enables math formulas |
| `comments: false` | Disables comments for that post (off globally for now) |

## Callouts

```markdown
> A tip.
{: .prompt-tip }
```

`prompt-tip`, `prompt-info`, `prompt-warning` and `prompt-danger` all work.

> Comments, analytics and the PWA are already wired up in `_config.yml` - they just need a value.
{: .prompt-info }
