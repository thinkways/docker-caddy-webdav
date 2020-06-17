FROM alpine:latest
RUN wget -O- 'https://caddyserver.com/download/linux/amd64?plugins=http.webdav&license=personal&telemetry=off' | tar xz caddy
COPY --from=0 caddy /usr/local/bin/
WORKDIR /caddy
COPY Caddyfile ./
ENV PORT=80 \
    USERNAME= \
    PASSWORD= \
    SCOPE=/srv
EXPOSE ${PORT}
ENTRYPOINT [ "caddy" ]
