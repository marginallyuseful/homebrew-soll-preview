# soll-preview — public Homebrew tap for experimental Soll builds

> ⚠️ **Experimental.** Every formula here is a one-off snapshot of an open
> [`marginallyuseful/soll`](https://github.com/marginallyuseful/soll) pull
> request. The binaries are unsigned, untested in production, and removed
> the moment the PR closes. Do **not** depend on them for anything that
> matters.

For stable releases, use the production tap:

```bash
brew tap marginallyuseful/tap
brew install soll
```

## Installing a preview build

Each open PR publishes a single formula named `soll-pr-<N>`, where `<N>` is
the PR number on `marginallyuseful/soll`. Each formula installs its binary
under that same PR-qualified name so multiple preview builds can coexist
without colliding with each other or with stable `soll`.

```bash
brew tap marginallyuseful/soll-preview
brew install marginallyuseful/soll-preview/soll-pr-123
soll-pr-123 --version
soll-pr-123 inspect path/to/file.ts
```

The PR's CI run posts a **`Soll Preview — Homebrew`** check on the pull
request with the exact install snippet and a link to the formula source as
soon as the build completes. Sibling checks (`Soll Preview — npm (native)`,
`Soll Preview — npm (CLI)`) carry install instructions for the matching
npm packages on GitHub Packages.

## What's published

| Artifact | Where | Naming |
| --- | --- | --- |
| Formula | `Formula/soll-pr-<N>.rb` on this repo's default branch | one per open PR |
| Prebuilt binaries | GitHub Releases on this repo, marked **prerelease** | tag `pr-<N>-<short-sha>`, assets `soll-pr-<N>-{macos-arm64,linux-x64,linux-arm64}` |

Each formula always points at the most recent commit's release for its PR;
older commits' releases are kept briefly (default: 3 most recent commits)
and then pruned by the daily cleanup job.

## Lifecycle

1. **PR opened / pushed**: CI on `marginallyuseful/soll` builds the CLI
   for macOS arm64, Linux x64, and Linux arm64, uploads them as a
   prerelease here, and updates `Formula/soll-pr-<N>.rb`.
2. **PR force-pushed**: same job overwrites the formula and creates a
   new release. The previous release lingers until the daily prune.
3. **PR closed/merged**: a `pull_request: closed` workflow on `soll` runs
   `cleanup-homebrew-tap` against this repo, deleting the formula file,
   all `pr-<N>-*` releases, and their tags.
4. **Daily cron** (06:30 UTC): full sweep — orphan formulae (PR no longer
   exists) and stale per-commit releases (older than the keep-recent
   threshold for an open PR) are pruned.

## Why this exists

CI already builds release-quality binaries for every PR, but they live as
workflow artifacts (expire with the run, require repo read access) and as
GitHub Packages npm packages (require an auth token). There was no way to
hand a non-collaborator a single-line install command for an experimental
build sitting on a PR. This tap is that channel.

## Manual cleanup

If a build slips through automatic cleanup (e.g. the cleanup workflow was
disabled while a PR closed), trigger it manually:

```bash
gh workflow run cleanup-preview-tap.yml \
  --repo marginallyuseful/soll \
  -f dry-run=true
```

The dry-run output lists exactly what would be deleted before you remove
the flag.

## Source

This tap is generated entirely by CI. The publish pipeline lives in
[`marginallyuseful/soll`](https://github.com/marginallyuseful/soll):

- [`docs/briefs/soll-preview-tap.md`](https://github.com/marginallyuseful/soll/blob/main/docs/briefs/soll-preview-tap.md) — design rationale.
- [`.github/actions/publish-homebrew/`](https://github.com/marginallyuseful/soll/tree/main/.github/actions/publish-homebrew) — formula generator + GitHub Release uploader.
- [`.github/actions/cleanup-homebrew-tap/`](https://github.com/marginallyuseful/soll/tree/main/.github/actions/cleanup-homebrew-tap) — pruning logic.
- [`.github/workflows/ci.yml`](https://github.com/marginallyuseful/soll/blob/main/.github/workflows/ci.yml) — `publish-homebrew-preview` job.
- [`.github/workflows/cleanup-preview-tap.yml`](https://github.com/marginallyuseful/soll/blob/main/.github/workflows/cleanup-preview-tap.yml) — close-event + daily prune.

Issues and PRs go on the upstream repo — this one is a publish target only.
