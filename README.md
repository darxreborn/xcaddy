# xcaddy

Custom [Caddy](https://caddyserver.com/) build published to Docker Hub as
[`darxreborn/xcaddy`](https://hub.docker.com/r/darxreborn/xcaddy).

Bundled modules:

- [`caddy-l4`](https://github.com/mholt/caddy-l4) — layer-4 (TCP/UDP) proxying
- [`transform-encoder`](https://github.com/caddyserver/transform-encoder) — log transform encoder
- [`caddy-crowdsec-bouncer`](https://github.com/hslatman/caddy-crowdsec-bouncer) — CrowdSec bouncer (`http`, `appsec`, `layer4`, tracking `@main`)

## Automated builds

`.github/workflows/build.yml` builds and pushes multi-arch (`amd64` + `arm64`) images:

- **Weekly** (Mondays 04:00 UTC) — picks up new releases of Caddy and the modules
- **Manual** — via the *Run workflow* button in the Actions tab
- **On change** — when the `Dockerfile` or workflow is updated

Each build is tagged `:latest` and `:<caddy-version>` (e.g. `:2.9.1`).

### Required secrets

| Secret | Value |
| --- | --- |
| `DOCKERHUB_USERNAME` | `darxreborn` |
| `DOCKERHUB_TOKEN` | a Docker Hub access token with Read/Write scope |
