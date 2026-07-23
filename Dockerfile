ARG CADDY_VERSION=2

FROM caddy:${CADDY_VERSION}-builder-alpine AS builder

RUN xcaddy build \
 --with github.com/mholt/caddy-l4 \
 --with github.com/caddyserver/transform-encoder \
 --with github.com/W0n9/caddy_waf_t1k \
 --replace github.com/chaitin/t1k-go=github.com/w0n9/t1k-go@latest

FROM caddy:${CADDY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
