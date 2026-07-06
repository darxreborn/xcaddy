# xcaddy

Custom [Caddy](https://caddyserver.com/) build published to Docker Hub as
[`darxreborn/xcaddy`](https://hub.docker.com/r/darxreborn/xcaddy).

Bundled modules:

- [`caddy-l4`](https://github.com/mholt/caddy-l4) — layer-4 (TCP/UDP) proxying
- [`transform-encoder`](https://github.com/caddyserver/transform-encoder) — log transform encoder
- [`caddy-crowdsec-bouncer`](https://github.com/hslatman/caddy-crowdsec-bouncer) — CrowdSec bouncer (`http`, `appsec`, `layer4`, tracking `@main`)

## Automated builds

`.github/workflows/build.yml` watches for new **Caddy releases** and publishes on change:

- **Watcher** — every 6 hours it checks the latest Caddy GitHub release. If that
  version hasn't been built yet, it builds and pushes.
- **Manual** — *Run workflow* button in the Actions tab (always builds latest).
- **On change** — when the `Dockerfile` or workflow is updated.

Each build is pinned to the release (`CADDY_VERSION`) and pushed as:

- `darxreborn/xcaddy:latest` — always the newest build
- `darxreborn/xcaddy:<version>` — e.g. `2.9.1`, so previous images stay reachable by version

Images are `linux/amd64`.

### Required secrets

| Secret | Value |
| --- | --- |
| `DOCKERHUB_USERNAME` | `darxreborn` |
| `DOCKERHUB_TOKEN` | a Docker Hub access token with Read/Write scope |
