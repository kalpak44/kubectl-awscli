# syntax=docker/dockerfile:1.7
FROM alpine:3.20

ARG TARGETARCH
ARG KUBECTL_VERSION
ARG AWSCLI_VERSION

# Basic tools
RUN apk add --no-cache \
      bash \
      ca-certificates \
      curl \
      jq \
      python3 \
      py3-pip \
    && update-ca-certificates

# Install AWS CLI v2 pinned via pip
RUN pip3 install --no-cache-dir "awscli==${AWSCLI_VERSION}" \
    && aws --version

# Install kubectl pinned
RUN set -eux; \
    curl -fsSL -o /usr/local/bin/kubectl \
      "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl"; \
    chmod +x /usr/local/bin/kubectl; \
    kubectl version --client=true --output=yaml

# Non-root user
RUN addgroup -S app && adduser -S app -G app
USER app:app
WORKDIR /home/app

ENTRYPOINT ["/bin/bash", "-lc"]
CMD ["aws --version && kubectl version --client"]
