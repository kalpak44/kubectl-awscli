# Changelog

The newest `## vX.Y.Z` heading below is the version this repository publishes — the
release workflow reads it from this file. Entries are written by the monthly release
agent (`.github/workflows/release.yml`).

## vNEXT

Removed the AWS CLI. On Alpine it is the Python build: it pulled in a Python runtime and
around sixty packages, and every Critical and all but one High finding in the image came
from two of them, with no fixed version Alpine had packaged. The image now ships kubectl,
curl, jq and bash.

Breaking for anything that called `aws` inside this image.

## v0.6.1 — 2026-09-14

Security rebuild. The previous image scanned as 10 Critical and 38 High; this one scans as 2 Critical and 3 High. The release notes list what remains and why.

### Fixed

- **curl** 8.21.0-r0 — 2 Critical, 7 High: CVE-2026-13608, CVE-2026-18924, CVE-2026-19931, CVE-2026-80229, CVE-2026-80230, CVE-2026-80231, CVE-2026-80255, CVE-2026-82208, CVE-2026-82209
- **jq** 1.8.1-r0 — 3 High: CVE-2026-32316, CVE-2026-40164, CVE-2026-49839
- **libcrypto3** 3.5.7-r0 — 2 Critical, 7 High: CVE-2026-14456, CVE-2026-14457, CVE-2026-18798, CVE-2026-54874, CVE-2026-63072, CVE-2026-63073, CVE-2026-63075, CVE-2026-63076, CVE-2026-75803
- **libcurl** 8.21.0-r0 — 2 Critical, 7 High: CVE-2026-13608, CVE-2026-18924, CVE-2026-19931, CVE-2026-80229, CVE-2026-80230, CVE-2026-80231, CVE-2026-80255, CVE-2026-82208, CVE-2026-82209
- **libexpat** 2.8.3-r0 — 4 High: CVE-2026-66046, CVE-2026-76641, CVE-2026-76956, CVE-2026-76957
- **libssl3** 3.5.7-r0 — 2 Critical, 7 High: CVE-2026-14456, CVE-2026-14457, CVE-2026-18798, CVE-2026-54874, CVE-2026-63072, CVE-2026-63073, CVE-2026-63075, CVE-2026-63076, CVE-2026-75803

### Contents

| tool | version |
|------|---------|
| alpine | 3.24.1 |
| kubectl | v1.37.0 |
| aws-cli | 2.34.63 |
| bash | 5.3.9 |
| curl | 8.22.0 |
| jq | 1.8.2 |
| python3 | 3.14.7 |
| musl | 1.2.6-r2 |
| openssl | 3.5.8-r0 |
| ca-certificates | 20260611-r0 |

## v0.6.0 — 2026-08-31

| tool | from | to |
|------|------|----|
| kubectl | v1.36.4 | v1.37.0 |

kubectl moves up a minor release to v1.37.0, which now bundles Kustomize v5.8.1.
Alpine stays on 3.24, so aws-cli remains the version that release ships
(2.34.63) and nothing else moved.


### Fixed

- **stdlib** go1.26.5 — 13 High: CVE-2026-33818, CVE-2026-46600, CVE-2026-56853, CVE-2026-56859, CVE-2026-56862, CVE-2026-56864, CVE-2026-56865, GO-2026-5026, GO-2026-5942, GO-2026-5972, GO-2026-6088, GO-2026-6089, GO-2026-6090

### Contents

| tool | version |
|------|---------|
| alpine | 3.24.1 |
| kubectl | v1.37.0 |
| aws-cli | 2.34.63 |
| bash | 5.3.9 |
| curl | 8.21.0 |
| jq | 1.8.1 |
| python3 | 3.14.7 |
| musl | 1.2.6-r2 |
| openssl | 3.5.7-r0 |
| ca-certificates | 20260611-r0 |

## v0.5.1 — 2026-08-25

Rebuild against current Alpine packages. No pinned version changed.

### Contents

| tool | version |
|------|---------|
| alpine | 3.24.1 |
| kubectl | v1.36.4 |
| aws-cli | 2.34.63 |
| bash | 5.3.9 |
| curl | 8.21.0 |
| jq | 1.8.1 |
| python3 | 3.14.7 |
| musl | 1.2.6-r2 |
| openssl | 3.5.7-r0 |
| ca-certificates | 20260611-r0 |

## v0.5.0 — 2026-08-24

| tool | from | to |
|------|------|----|
| alpine | 3.22 | 3.24 |
| aws-cli | 2.27.25 | 2.34.63 |

Security rebuild. The previous image scanned as 8 Critical and 36 High; this one scans as 2 Critical and 18 High. The release notes list what remains and why.

## v0.4.0 — 2026-08-24

| tool | from | to |
|------|------|----|
| alpine | 3.21 | 3.22 |

The base image moves from Alpine 3.21 to 3.22, so aws-cli follows along and is now
2.27.25 from the 3.22 package repository. kubectl stays pinned at v1.36.4, which is
still the current stable release. Picking this image up pulls in the newer Alpine
userspace, curl, and aws-cli updates.

## v0.3.0 — 2026-08-24

| tool | from | to |
|------|------|----|
| alpine | 3.20 | 3.21 |

The base image moves from Alpine 3.20 to 3.21, so aws-cli follows along and is now
2.22.10 from the 3.21 package repository. kubectl stays pinned at v1.36.4, which is
still the current stable release. Picking this image up pulls in the newer Alpine
userspace, curl, and aws-cli updates.

## v0.2.0 — 2026-08-24

| tool | from | to |
|------|------|----|
| kubectl | (unpinned) | v1.36.4 |

kubectl was previously resolved from `dl.k8s.io/release/stable.txt` at build time,
so every rebuild silently produced a different image. It is now pinned in the
Dockerfile and moved deliberately by the monthly release agent. Alpine stays at 3.20
and aws-cli continues to follow it.

## v0.1.0

Initial image: Alpine with kubectl and the AWS CLI.
