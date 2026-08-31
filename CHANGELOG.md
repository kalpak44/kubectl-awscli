# Changelog

The newest `## vX.Y.Z` heading below is the version this repository publishes — the
release workflow reads it from this file. Entries are written by the monthly release
agent (`.github/workflows/release.yml`).

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
