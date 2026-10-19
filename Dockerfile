# syntax=docker/dockerfile:1.7

# Pinned upstream versions. Maintained by the monthly release agent in
# .github/workflows/release.yml — see CHANGELOG.md for the history. There is no
# separate versions file: this Dockerfile is the source of truth.
#
# The apk packages below are installed unversioned on purpose: an exact `=version`
# pin breaks as soon as Alpine drops the old package, so their versions follow the
# base image tag.
#
# aws-cli is deliberately absent. On Alpine it is the Python build, which pulled in a
# Python runtime and around sixty packages — and those packages, not this image's own
# tools, carried every Critical finding it had.
FROM alpine:3.24

ARG TARGETARCH
ARG TARGETVARIANT

# kubectl is fetched from dl.k8s.io, which keeps every released version, so it can
# be pinned exactly.
ARG KUBECTL_VERSION=v1.37.1

# openssl is listed explicitly so apk takes the current openssl from this Alpine
# branch, which also moves the libcrypto3/libssl3 libraries baked into alpine:3.24.
#
# zlib cannot be dropped (apk-tools links libapk against it) and the alpine:3.24
# rootfs still ships 1.3.2-r0 while v3.24/main carries 1.3.2-r1 (CVE-2026-85091).
# --upgrade moves that one installed package to the current revision and nothing
# else; it is scoped to the packages named here, not a whole-rootfs refresh.
RUN apk add --no-cache --upgrade \
      bash \
      ca-certificates \
      curl \
      jq \
      openssl \
      zlib \
    && update-ca-certificates \
    && jq --version

RUN set -eux; \
    ARCH="${TARGETARCH}"; \
    if [ "${TARGETARCH}" = "arm" ] && [ "${TARGETVARIANT}" = "v7" ]; then ARCH="arm"; fi; \
    curl -fsSL -o /usr/local/bin/kubectl \
      "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl"; \
    chmod +x /usr/local/bin/kubectl; \
    kubectl version --client=true --output=yaml

# Run as non-root by default (fixes: "runAsNonRoot and image will run as root")
RUN addgroup -g 1000 -S app && adduser -u 1000 -S app -G app
USER 1000:1000
WORKDIR /home/app

ENTRYPOINT ["/bin/bash", "-lc"]
CMD ["kubectl version --client"]
