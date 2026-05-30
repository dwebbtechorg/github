# Getting Started

This page walks through running the documentation site on your own machine.

## Prerequisites

- [Python 3.12+](https://www.python.org/) **or** [Docker](https://www.docker.com/)

## Option 1: Run with Python

```bash
pip install -r requirements.txt
mkdocs serve
```

The site will be available at [http://localhost:8000](http://localhost:8000).

## Option 2: Run with Docker

Build the image and start a container that serves the site:

```bash
docker build -t example-mkdocs .
docker run --rm --network host example-mkdocs
```

With `--network host`, the container shares the host's network stack, so the
site is reachable directly at [http://localhost:8000](http://localhost:8000).

## Building static output

To produce a static HTML build in the `site/` directory:

```bash
mkdocs build
```
