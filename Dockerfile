# Build the static site, then serve it with a small runtime image.
FROM python:3.12-slim AS build

WORKDIR /docs

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY mkdocs.yml ./
COPY docs/ ./docs/

RUN mkdocs build --strict


FROM python:3.12-slim

WORKDIR /site

# A tiny static file server; no extra dependencies needed beyond stdlib.
COPY --from=build /docs/site/ ./

EXPOSE 8000

# Serve the built site. With `--network host` the container binds to the
# host's port 8000 directly.
CMD ["python", "-m", "http.server", "8000", "--bind", "0.0.0.0"]
