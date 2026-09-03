# Curio — a self-hosted bookmark library
# Static single-page app served by nginx. No build step: index.html is the app.

FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="Curio" \
      org.opencontainers.image.description="A self-hosted bookmark library with collections, tags, and search." \
      org.opencontainers.image.version="1.0.0" \
      org.opencontainers.image.authors="Waliul Awal Taha <https://waliulawaltaha.com>" \
      org.opencontainers.image.licenses="MIT"

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget -qO- http://127.0.0.1:80/ >/dev/null || exit 1
