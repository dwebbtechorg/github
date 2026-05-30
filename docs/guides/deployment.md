# Deployment

The site is deployed to a **self-hosted runner** as a Docker container using
GitHub Actions.

## How it works

1. A push to the default branch (or a manual trigger) starts the workflow.
2. The job runs on a runner labeled `self-hosted`.
3. The runner builds the Docker image from the `Dockerfile`.
4. Any previous container is stopped and removed.
5. A new container is started with `--network host` so it binds directly to
   the host's network interfaces.

## Networking

The container is started with host networking:

```bash
docker run -d --name example-mkdocs --network host example-mkdocs
```

Because of `--network host`, no `-p` port mapping is required — the
containerized server listens on the host's port `8000` directly.

!!! warning "Host networking is Linux-only"
    The `--network host` mode behaves as described on Linux hosts. On Docker
    Desktop for macOS/Windows the semantics differ, so this deployment assumes
    a Linux self-hosted runner.

## The workflow

See [`.github/workflows/deploy.yml`](https://github.com/dwebbtechorg/github/blob/main/.github/workflows/deploy.yml)
in the repository for the complete definition.
