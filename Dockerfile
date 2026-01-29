FROM alpine:3.20

ARG TARGETARCH

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
    curl -fsSL -o /usr/local/bin/kubectl \
      "https://dl.k8s.io/release/${KVER}/bin/linux/${TARGETARCH}/kubectl"; \
    chmod +x /usr/local/bin/kubectl; \
    kubectl version --client=true --output=yaml

# Non-root user
RUN addgroup -S app && adduser -S app -G app
USER app:app
WORKDIR /home/app

ENTRYPOINT ["/bin/bash", "-lc"]
CMD ["aws --version && kubectl version --client"]
