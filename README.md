# Example MkDocs Site

A small [MkDocs](https://www.mkdocs.org/) documentation site (using the
[Material](https://squidfunk.github.io/mkdocs-material/) theme) that is built
into a Docker image and deployed to a **self-hosted runner** via GitHub
Actions, running with **host networking**.

## Project layout

```
.
├── docs/                     # Markdown source pages
│   ├── index.md
│   ├── getting-started.md
│   ├── about.md
│   └── guides/
│       ├── configuration.md
│       └── deployment.md
├── mkdocs.yml                # Site configuration
├── requirements.txt          # Python dependencies
├── Dockerfile                # Builds and serves the site
└── .github/workflows/
    └── deploy.yml            # CI/CD: build + run on self-hosted runner
```

## Run locally

With Python:

```bash
pip install -r requirements.txt
mkdocs serve
```

With Docker (host networking):

```bash
docker build -t example-mkdocs .
docker run --rm --network host example-mkdocs
```

Then open <http://localhost:8000>.

## Deployment

Pushing to `main` (or running the workflow manually) triggers
`.github/workflows/deploy.yml`, which runs on a runner labeled `self-hosted`.
It builds the Docker image, removes any previous container, and starts a new
one with `--network host` so it binds to the host's port `8000` directly.
