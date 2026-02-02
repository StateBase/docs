<div align="center">

# StateBase Documentation

**Technical documentation for StateBase API**

[![Docusaurus](https://img.shields.io/badge/Docusaurus-3.0-green.svg)](https://docusaurus.io/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.0+-blue.svg)](https://www.typescriptlang.org/)

[Live Docs](https://docs.statebase.org) • [Staging](https://staging-docs.statebase.org)

</div>

---

## Overview

Comprehensive technical documentation built with Docusaurus, featuring:

- **API Reference**: Complete REST API documentation
- **SDK Guides**: Python and TypeScript integration guides
- **Tutorials**: Step-by-step implementation guides
- **Concepts**: Architecture and design principles
- **Examples**: Real-world use cases

---

## Tech Stack

| Technology | Purpose |
|------------|---------|
| **Docusaurus 3.0** | Documentation framework |
| **TypeScript** | Type-safe development |
| **MDX** | Markdown with React components |
| **Algolia** | Search functionality |
| **Vercel** | Hosting and deployment |

---

## Getting Started

### Prerequisites

- Node.js 18+
- npm/yarn/pnpm

### Installation

```bash
# Clone repository
git clone https://github.com/StateBase/docs.git
cd docs

# Install dependencies
npm install

# Run development server
npm start
```

Open [http://localhost:3000](http://localhost:3000) to view the docs.

---

## Project Structure

```
statebase-docs/
├── docs/                 # Documentation content
│   ├── getting-started/  # Quickstart guides
│   ├── api-reference/    # API documentation
│   ├── sdks/             # SDK guides
│   │   ├── python/
│   │   └── typescript/
│   ├── concepts/         # Architecture docs
│   ├── tutorials/        # Step-by-step guides
│   └── examples/         # Code examples
├── blog/                 # Blog posts
├── src/
│   ├── components/       # Custom React components
│   ├── css/              # Custom styles
│   └── pages/            # Custom pages
├── static/               # Static assets
│   ├── img/
│   └── openapi/          # OpenAPI spec
└── docusaurus.config.js  # Docusaurus configuration
```

---

## Content Organization

### Documentation Sections

1. **Getting Started**
   - Quickstart
   - Installation
   - First API call
   - Authentication

2. **API Reference**
   - Sessions
   - State Management
   - Memory
   - Traces
   - Rollback

3. **SDKs**
   - Python SDK
   - TypeScript SDK
   - REST API

4. **Concepts**
   - Architecture
   - State Versioning
   - Decision Tracing
   - Semantic Memory

5. **Tutorials**
   - Building a chatbot
   - Implementing rollback
   - Memory search
   - Production deployment

6. **Examples**
   - LangChain integration
   - OpenAI integration
   - Next.js app
   - Express.js app

---

## Writing Documentation

### Creating a New Page

```bash
# Create new doc
touch docs/category/new-page.md
```

### Frontmatter

```markdown
---
id: unique-id
title: Page Title
sidebar_label: Sidebar Label
sidebar_position: 1
description: SEO description
keywords: [keyword1, keyword2]
---

# Page Title

Content goes here...
```

### Code Blocks

````markdown
```python title="example.py"
from statebase import StateBase

sb = StateBase(api_key="your_key")
session = sb.sessions.create(agent_id="bot")
```
````

### Interactive Components

```mdx
import CodeBlock from '@theme/CodeBlock';
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

<Tabs>
  <TabItem value="python" label="Python">
    <CodeBlock language="python">
      {`sb = StateBase(api_key="key")`}
    </CodeBlock>
  </TabItem>
  <TabItem value="typescript" label="TypeScript">
    <CodeBlock language="typescript">
      {`const sb = new StateBase({ apiKey: "key" })`}
    </CodeBlock>
  </TabItem>
</Tabs>
```

---

## Development

### Available Scripts

```bash
# Development server
npm start

# Production build
npm run build

# Serve production build
npm run serve

# Clear cache
npm run clear

# Deploy to GitHub Pages
npm run deploy
```

### Live Reload

Docusaurus supports hot reloading. Edit any `.md` or `.mdx` file and see changes instantly.

---

## Configuration

### docusaurus.config.js

```javascript
module.exports = {
  title: 'StateBase Documentation',
  tagline: 'Production-grade memory for AI agents',
  url: 'https://docs.statebase.org',
  baseUrl: '/',
  
  // Theme
  themeConfig: {
    navbar: {
      title: 'StateBase',
      logo: {
        src: 'img/logo.svg',
      },
      items: [
        {
          type: 'doc',
          docId: 'intro',
          position: 'left',
          label: 'Docs',
        },
        {
          to: '/blog',
          label: 'Blog',
          position: 'left'
        },
        {
          href: 'https://github.com/StateBase',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    
    // Search (Algolia)
    algolia: {
      appId: 'YOUR_APP_ID',
      apiKey: 'YOUR_API_KEY',
      indexName: 'statebase',
    },
  },
};
```

---

## Search (Algolia)

### Setup

1. Sign up for [Algolia DocSearch](https://docsearch.algolia.com/)
2. Submit your documentation URL
3. Receive API credentials
4. Add to `docusaurus.config.js`:

```javascript
algolia: {
  appId: 'YOUR_APP_ID',
  apiKey: 'YOUR_API_KEY',
  indexName: 'statebase',
}
```

### Manual Indexing

```bash
# Install Algolia crawler
npm install -g @algolia/crawler

# Run crawler
algolia-crawler crawl --config algolia-config.json
```

---

## OpenAPI Integration

### Generating API Reference

```bash
# Install OpenAPI generator
npm install -g @docusaurus/plugin-openapi-docs

# Generate docs from OpenAPI spec
npx docusaurus gen-api-docs all
```

### OpenAPI Spec Location

Place your OpenAPI spec at:
```
static/openapi/statebase-api.yaml
```

---

## Versioning

### Creating a New Version

```bash
# Create version 1.0.0
npm run docusaurus docs:version 1.0.0
```

This creates:
- `versioned_docs/version-1.0.0/` - Snapshot of docs
- `versioned_sidebars/version-1.0.0-sidebars.json` - Sidebar config

### Version Dropdown

Users can switch between versions in the navbar.

---

## Deployment

### Vercel (Recommended)

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel --prod
```

### GitHub Pages

```bash
# Deploy to GitHub Pages
GIT_USER=<your-username> npm run deploy
```

### Manual Build

```bash
# Build static site
npm run build

# Output in build/
# Deploy build/ to any static host
```

---

## SEO Optimization

### Meta Tags

Each page includes:
- Title (< 60 characters)
- Description (< 160 characters)
- Keywords
- Open Graph tags
- Twitter Card tags

### Sitemap

Auto-generated at `/sitemap.xml`

### robots.txt

```
User-agent: *
Allow: /

Sitemap: https://docs.statebase.org/sitemap.xml
```

---

## Analytics

### Google Analytics

```javascript
// docusaurus.config.js
module.exports = {
  themeConfig: {
    gtag: {
      trackingID: 'G-XXXXXXXXXX',
      anonymizeIP: true,
    },
  },
};
```

### Custom Events

```javascript
import ExecutionEnvironment from '@docusaurus/ExecutionEnvironment';

if (ExecutionEnvironment.canUseDOM) {
  window.gtag('event', 'code_copy', {
    language: 'python',
    page: window.location.pathname
  });
}
```

---

## Custom Components

### API Endpoint Card

```mdx
import ApiEndpoint from '@site/src/components/ApiEndpoint';

<ApiEndpoint
  method="POST"
  path="/v1/sessions"
  description="Create a new session"
/>
```

### Code Sandbox

```mdx
import CodeSandbox from '@site/src/components/CodeSandbox';

<CodeSandbox
  template="python"
  files={{
    'main.py': 'from statebase import StateBase\n...'
  }}
/>
```

---

## Style Guide

### Writing Guidelines

- **Tone**: Technical, professional, helpful
- **Voice**: Second person ("you")
- **Tense**: Present tense
- **Code**: Always include working examples
- **Links**: Use relative links for internal pages

### Formatting

- **Headings**: Sentence case
- **Code**: Use inline code for `variables`, `functions`, `endpoints`
- **Lists**: Use bullet points for unordered, numbers for steps
- **Emphasis**: Use **bold** for important terms, *italic* for emphasis

---

## Contributing

### Documentation Contributions

1. Fork the repository
2. Create feature branch
3. Make changes to `.md` or `.mdx` files
4. Test locally (`npm start`)
5. Submit pull request

### Review Process

- All PRs reviewed by docs team
- Check for technical accuracy
- Verify code examples work
- Ensure consistent style

---

## Maintenance

### Regular Updates

- [ ] Update API reference when API changes
- [ ] Add new SDK examples
- [ ] Keep version compatibility matrix current
- [ ] Update screenshots/diagrams
- [ ] Fix broken links

### Quarterly Reviews

- Review analytics for popular pages
- Identify gaps in documentation
- Update outdated content
- Improve search rankings

---

## Support

- **Issues**: [GitHub Issues](https://github.com/StateBase/docs/issues)
- **Email**: docs@statebase.org
- **Discord**: [discord.gg/statebase](https://discord.gg/statebase)

---

## License

MIT License - see [LICENSE](LICENSE) file for details.

---

<div align="center">

**[StateBase](https://statebase.org)** • **[API](https://api.statebase.org)** • **[Dashboard](https://dashboard.statebase.org)**

</div>
