FROM alpine:latest
RUN wget -O- 'https://caddyserver.com/download/linux/amd64?plugins=http.webdav&license=personal&telemetry=off' | tar xz caddy

RUN mkdir /caddy
WORKDIR /caddy
RUN mv caddy /caddy/caddy

COPY Caddyfile ./
ENV PORT=80 \
    USERNAME= \
    PASSWORD= \
    SCOPE=/srv
EXPOSE ${PORT}
ENTRYPOINT [ "caddy" ]
