# kubectl-awscli

A small container image that bundles:

- **kubectl** (pinned version)
- **curl** and **jq**

Built for Kubernetes automation jobs like:
- cluster maintenance scripts
- CI/CD helper tasks

The AWS CLI was removed in v0.7.0. It is the Python build on Alpine, and it brought a
Python runtime and about sixty packages with it, which was the image's entire
Critical/High vulnerability surface. Jobs that need it should install it themselves or
use an image that ships it.

---

## Image

**GitHub Container Registry (GHCR)**

- `ghcr.io/kalpak44/kubectl-awscli:latest`
- `ghcr.io/kalpak44/kubectl-awscli:<IMAGE_VERSION>`

Example:

```bash
docker pull ghcr.io/kalpak44/kubectl-awscli:latest
```

---

## Versions

Versions are managed in `versions.env`:

```env
IMAGE_VERSION=0.1.0
KUBECTL_VERSION=v1.34.0
AWSCLI_VERSION=2.22.35
```

---

## Usage

### Run locally

```bash
docker run --rm ghcr.io/kalpak44/kubectl-awscli:latest kubectl version --client
docker run --rm ghcr.io/kalpak44/kubectl-awscli:latest 'kubectl config view -o json | jq .kind'
```

### Kubernetes CronJob example

```yaml
containers:
  - name: refresh
    image: ghcr.io/kalpak44/kubectl-awscli:0.1.0
    command:
      - /bin/bash
      - -lc
      - |
        set -euo pipefail
        kubectl version --client
```

---

## Build & Push

The image is built automatically via GitHub Actions:

- `.github/workflows/build-image.yml`

To release a new version:
1. Update `versions.env` (IMAGE_VERSION / tool versions)
2. Push to `main`
3. Image is published to GHCR

