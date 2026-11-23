---
title: Hello, world
date: 2026-11-23 10:00:00 +0530
categories: [Start Here]
tags: [blog, meta]
description: Why this blog exists, what lands here, and how the series are organised.
pin: true
---

This is the first post. The point of this blog is simple: write down what I learn while it is still fresh, so future me does not have to relearn it, and so someone else can skip the same dead ends.

## What gets published here

The blog runs as series rather than one-off posts. Each series covers one area end to end:

- **Bug Bounty** — recon, attack surface, and the small findings that never make it into a report.
- **Web Security** — access control, authentication, SSRF, injection, business logic.
- **Reverse Engineering** — Android apps, binaries, and how an app actually works inside.
- **AI Security** — agents, MCP servers and automation that speed up security work.

The current list, with every post in reading order, is on the [Series](/series/) page.

## How it is written

Every post is a Markdown file in the repository, so code, tables and callouts all work:

```bash
# first step of any recon
subfinder -d example.com -silent | httpx -silent
```

> If something here is wrong or can be extended, the **Edit this post** link at the bottom of each post opens the file on GitHub.
{: .prompt-tip }

Everything older than the current page is in [Archives](/archives/).
