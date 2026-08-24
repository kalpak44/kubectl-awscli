# Changelog

The newest `## vX.Y.Z` heading below is the version this repository publishes — the
release workflow reads it from this file. Entries are written by the monthly release
agent (`.github/workflows/release.yml`).

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