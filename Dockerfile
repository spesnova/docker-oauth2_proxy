FROM alpine

RUN apk add --no-cache openssl ca-certificates

ENV ENTRYKIT_VERSION 0.4.0
RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz

ENV OAUTH2_PROXY_VERSION=2.2
ENV GO_VERSION=1.8.1
RUN wget https://github.com/bitly/oauth2_proxy/releases/download/v${OAUTH2_PROXY_VERSION}/oauth2_proxy-${OAUTH2_PROXY_VERSION}.0.linux-amd64.go${GO_VERSION}.tar.gz \
  && tar -xvzf oauth2_proxy-${OAUTH2_PROXY_VERSION}.0.linux-amd64.go${GO_VERSION}.tar.gz \
  && mv oauth2_proxy-${OAUTH2_PROXY_VERSION}.0.linux-amd64.go${GO_VERSION}/oauth2_proxy /usr/local/bin/oauth2_proxy \
  && chmod +x /usr/local/bin/oauth2_proxy \
  && rm -r oauth2_proxy-${OAUTH2_PROXY_VERSION}.0.linux-amd64.go${GO_VERSION}*

WORKDIR /app
COPY oauth2_proxy.cfg.tmpl /app/oauth2_proxy.cfg.tmpl

ENTRYPOINT [ \
  "switch", \
    "shell=/bin/sh", \
    "--", \
  "render", \
    "/app/oauth2_proxy.cfg", \
    "--", \
  "/usr/local/bin/oauth2_proxy" \
]

CMD ["-config=/app/oauth2_proxy.cfg"]
