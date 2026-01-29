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

# Run as non-root by default (fixes: "runAsNonRoot and image will run as root")
RUN addgroup -g 1000 -S app && adduser -u 1000 -S app -G app
USER 1000:1000
WORKDIR /home/app

ENTRYPOINT ["/bin/bash", "-lc"]
CMD ["aws --version && kubectl version --client"]
