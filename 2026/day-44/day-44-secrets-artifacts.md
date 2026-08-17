# Day 44 – Secrets, Artifacts & Running Real Tests in CI

Today the pipeline in my `github-actions-practice` repo ([riyan-ahmed/GitHub-actions](https://github.com/riyan-ahmed/GitHub-actions)) started doing real work: reading secrets safely, passing artifacts between jobs, running an actual script with pass/fail behavior, and caching dependencies.

---

## Task 1 & 2 – GitHub Secrets

`.github/workflows/secrets-demo.yml`:

```yaml
---
name: Secrets Demo

"on":
  workflow_dispatch:
  push:
    paths:
      - ".github/workflows/secrets-demo.yml"

jobs:
  check-secret:
    runs-on: ubuntu-latest

    steps:
      - name: Check if secret is set (never print the value)
        run: |
          if [ -n "${{ secrets.MY_SECRET_MESSAGE }}" ]; then
            echo "The secret is set: true"
          else
            echo "The secret is set: false"
          fi

      - name: Try to print the secret directly
        run: 'echo "Raw value: ${{ secrets.MY_SECRET_MESSAGE }}"'

  use-as-env:
    runs-on: ubuntu-latest

    steps:
      - name: Use secrets as environment variables
        env:
          DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
          DOCKER_TOKEN: ${{ secrets.DOCKER_TOKEN }}
        run: |
          echo "Would log in to Docker Hub as: $DOCKER_USERNAME"
          echo "Token length: ${#DOCKER_TOKEN} characters"
```

Secrets `MY_SECRET_MESSAGE`, `DOCKER_USERNAME`, and `DOCKER_TOKEN` were added under **Settings → Secrets and variables → Actions** in the `GitHub-actions` repo.

When I tried to print `${{ secrets.MY_SECRET_MESSAGE }}` directly, GitHub Actions replaced the value with `***` in the logs instead of showing the actual text — it automatically masks any string that matches a configured secret's value, everywhere it appears in the log output.

**Why you should never print secrets in CI logs:** CI logs are often stored, cached, and readable by anyone with access to the repo/Actions history (and sometimes by CI vendors or forked-PR contributors). A leaked secret in a log is effectively a leaked credential — GitHub's masking helps, but it isn't foolproof (e.g. it won't catch a secret that's been transformed, base64-encoded, or split across lines), so the real rule is to never deliberately echo a secret and to only ever reference it through `${{ secrets.X }}` or as an environment variable consumed by a tool, never printed.

**Live run:** [Secrets Demo — success](https://github.com/riyan-ahmed/GitHub-actions/actions/workflows/secrets-demo.yml)

---

## Task 3 & 4 – Upload & Download Artifacts Between Jobs

`.github/workflows/artifacts.yml`:

```yaml
---
name: Artifacts Demo

"on":
  workflow_dispatch:
  push:
    paths:
      - ".github/workflows/artifacts.yml"

jobs:
  generate-report:
    runs-on: ubuntu-latest

    steps:
      - name: Create a report file
        run: |
          mkdir -p reports
          echo "Build report generated at $(date -u)" > reports/build-report.txt
          echo "Commit: ${{ github.sha }}" >> reports/build-report.txt

      - name: Upload report artifact
        uses: actions/upload-artifact@v4
        with:
          name: build-report
          path: reports/build-report.txt

  consume-report:
    needs: generate-report
    runs-on: ubuntu-latest

    steps:
      - name: Download report artifact from previous job
        uses: actions/download-artifact@v4
        with:
          name: build-report

      - name: Print report contents
        run: cat build-report.txt
```

`generate-report` writes and uploads `build-report.txt`; the independent `consume-report` job (which has no filesystem access to the first job's runner) downloads that same artifact and prints it, proving the file survived the handoff between two separate VMs.

**Verified:** the artifact `build-report` (243 bytes) appeared under the run's **Artifacts** section on the Actions tab and was downloadable as a zip.

**Live run:** [Artifacts Demo — success](https://github.com/riyan-ahmed/GitHub-actions/actions/workflows/artifacts.yml)

**When would you use artifacts in a real pipeline?** Any time output from one job needs to survive into a later job (or needs to be kept as a build record) — e.g. passing a compiled binary from a `build` job to a `deploy` job, saving test/coverage reports for review, or archiving logs from a failed run for debugging. Jobs run on fresh, isolated VMs, so artifacts are the mechanism for moving files between them (or off the runner entirely) since nothing on one job's filesystem is visible to another.

---

## Task 5 – Run Real Tests in CI

I reused `sample_logs_generator.sh` from Day 20 (`scripts/sample_logs_generator.sh` in the practice repo) and wrote a workflow to run it for real:

```yaml
---
name: Real Script Tests

"on":
  workflow_dispatch:
  push:
    paths:
      - "scripts/**"
      - ".github/workflows/real-tests.yml"

jobs:
  run-script:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Make script executable
        run: chmod +x scripts/sample_logs_generator.sh

      - name: Run log generator script
        run: |
          mkdir -p logs
          ./scripts/sample_logs_generator.sh logs/sample.log 20

      - name: Show generated log file
        run: cat logs/sample.log
```

**The pipeline actually broke first, for real:** the first version of this workflow ran `./scripts/sample_logs_generator.sh logs/sample.log 20` without creating the `logs/` directory first. On a fresh runner checkout that directory doesn't exist, so the script's internal `touch`/`>>` writes silently failed and the following `cat logs/sample.log` step failed with "No such file or directory" — [run #32030854537, conclusion: failure](https://github.com/riyan-ahmed/GitHub-actions/actions/runs/32030854537).

**Fix:** added `mkdir -p logs` before invoking the script. Pushed again — [run #32031032213, conclusion: success](https://github.com/riyan-ahmed/GitHub-actions/actions/runs/32031032213).

---

## Task 6 – Caching

`.github/workflows/cache-deps.yml`:

```yaml
---
name: Dependency Cache Demo

"on":
  workflow_dispatch:
  push:
    paths:
      - "requirements.txt"
      - ".github/workflows/cache-deps.yml"

jobs:
  install-deps:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Cache pip dependencies
        uses: actions/cache@v4
        with:
          path: ~/.cache/pip
          key: ${{ runner.os }}-pip-${{ hashFiles('requirements.txt') }}
          restore-keys: |
            ${{ runner.os }}-pip-

      - name: Install dependencies
        run: pip install -r requirements.txt

      - name: Show installed packages
        run: pip list
```

**Live run:** [Dependency Cache Demo — success](https://github.com/riyan-ahmed/GitHub-actions/actions/workflows/cache-deps.yml)

**What is being cached and where is it stored?** The `path: ~/.cache/pip` directory — pip's own download/wheel cache — is what gets cached, not the installed packages themselves (those still get reinstalled from the cache instead of the network). GitHub stores the cache as a compressed archive in its own cache service, keyed by `${{ runner.os }}-pip-${{ hashFiles('requirements.txt') }}`; on a cache hit, the archive is restored to that path before `pip install` runs, so pip resolves packages from local wheels instead of re-downloading them, so a run with an unchanged `requirements.txt` installs noticeably faster than a completely cold run. If `requirements.txt` changes, the hash changes, the key misses, and a fresh cache entry is created.

---

## What I learned about secrets management

- Secrets are write-only from the UI/CLI side — once saved you can never view the value again, only overwrite or delete it.
- They're scoped to the repo (or org/environment) and are only injected into a workflow run when explicitly referenced via `${{ secrets.NAME }}`; forks of the repo do **not** get access to the base repo's secrets on `pull_request` events, which prevents a malicious PR from exfiltrating them.
- GitHub's automatic masking replaces the literal secret value with `***` anywhere it appears in the raw log text, but it only catches exact string matches — so it's still on me to never deliberately print, log, or write a secret to a file/artifact that gets uploaded.
- Passing a secret through `env:` and consuming it as a shell variable is the safe pattern for tools (like `docker login`) that expect credentials via environment rather than as CLI arguments — CLI arguments can leak through `ps` or shell history in ways env vars passed this way don't.

---

## Notes for submission

Screenshots (artifact download, green run) are captured manually from the Actions tab of [riyan-ahmed/GitHub-actions](https://github.com/riyan-ahmed/GitHub-actions) and added to this folder separately.
