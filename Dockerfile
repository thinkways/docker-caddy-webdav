FROM alpine:latest
RUN wget -O- 'https://caddyserver.com/download/linux/amd64?plugins=http.webdav&license=personal&telemetry=off' | tar xz caddy
RUN mkdir /caddy_dir
RUN mv caddy /caddy_dir/caddy

WORKDIR /caddy_dir
COPY Caddyfile ./
ENV PORT=80 \
    USERNAME= \
    PASSWORD= \
    SCOPE=/srv
EXPOSE ${PORT}
ENTRYPOINT [ "caddy" ]
