# Deployment

The site is deployed to the **host** as a Docker container using GitHub Actions
and a self-hosted runner.

## How it works

The self-hosted runner runs **inside a container** (the sandbox), so Docker work
can't be done in the runner directly — it has to happen on the real host. The
workflow does this by reaching the host over SSH:

1. A push to the default branch (or a manual trigger) starts the workflow.
2. The job runs on a runner labeled `self-hosted`.
3. The build context is copied to the host over SCP.
4. The workflow SSHes into the host at `172.17.0.1` (the Docker bridge gateway)
   as the `dave` user, using the `SANDSLASH_SSH` secret.
5. On the host it builds the Docker image, removes any previous container, and
   starts a new one with `--network host`.

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
    a Linux host.

## Required secret

| Secret | Purpose |
| --- | --- |
| `SANDSLASH_SSH` | Private SSH key for the `dave` user on the host |

## The workflow

See [`.github/workflows/deploy.yml`](https://github.com/dwebbtechorg/github/blob/main/.github/workflows/deploy.yml)
in the repository for the complete definition.
