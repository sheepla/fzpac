FROM alpine:3.14

ARG SHFMT_VERSION="v3.3.1"
ARG SHELLCHECK_VERSION="v0.7.2"

WORKDIR /tmp
RUN apk add --no-cache wget && \
    wget -O /usr/local/bin/shfmt https://github.com/mvdan/sh/releases/download/${SHFMT_VERSION}/shfmt_${SHFMT_VERSION}_linux_amd64 && \
    chmod +x /usr/local/bin/shfmt && \
    wget https://github.com/koalaman/shellcheck/releases/download/${SHELLCHECK_VERSION}/shellcheck-${SHELLCHECK_VERSION}.linux.x86_64.tar.xz && \
    tar xf shellcheck-${SHELLCHECK_VERSION}.linux.x86_64.tar.xz && \
    install -m 0755 shellcheck-${SHELLCHECK_VERSION}/shellcheck /usr/local/bin/shellcheck
