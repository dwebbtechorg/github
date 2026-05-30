# Configuration

The site is configured through a single `mkdocs.yml` file at the repository root.

## Key sections

### Theme

We use the **Material** theme with light/dark palette toggles:

```yaml
theme:
  name: material
  palette:
    - scheme: default
      toggle:
        icon: material/weather-night
        name: Switch to dark mode
```

### Navigation

The `nav` block controls the sidebar and tabs. Nested entries become
collapsible sections:

```yaml
nav:
  - Home: index.md
  - Guides:
      - Configuration: guides/configuration.md
      - Deployment: guides/deployment.md
```

### Markdown extensions

Extensions add features like admonitions, syntax highlighting, and
permalink anchors:

```yaml
markdown_extensions:
  - admonition
  - toc:
      permalink: true
  - pymdownx.superfences
```

!!! note
    See the [Material for MkDocs reference](https://squidfunk.github.io/mkdocs-material/setup/)
    for the full list of options.
