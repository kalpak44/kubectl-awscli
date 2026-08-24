# Changelog

The newest `## vX.Y.Z` heading below is the version this repository publishes — the
release workflow reads it from this file. Entries are written by the monthly release
agent (`.github/workflows/release.yml`).

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
