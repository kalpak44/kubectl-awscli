# syntax=docker/dockerfile:1.7
FROM alpine:3.20

ARG TARGETARCH
ARG TARGETVARIANT

RUN apk add --no-cache \
      bash \
      ca-certificates \
      curl \
      jq \
      aws-cli \
    && update-ca-certificates \
    && aws --version

# Install latest stable kubectl
RUN set -eux; \
    KVER="$(curl -fsSL https://dl.k8s.io/release/stable.txt)"; \
    ARCH="${TARGETARCH}"; \
    if [ "${TARGETARCH}" = "arm" ] && [ "${TARGETVARIANT}" = "v7" ]; then ARCH="arm"; fi; \
    curl -fsSL -o /usr/local/bin/kubectl \
      "https://dl.k8s.io/release/${KVER}/bin/linux/${ARCH}/kubectl"; \
    chmod +x /usr/local/bin/kubectl; \
    kubectl version --client=true --output=yaml
