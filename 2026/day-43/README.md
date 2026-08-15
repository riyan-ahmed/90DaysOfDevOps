# Day 43 – Jobs, Steps, Environment Variables & Conditionals

Today I explored how GitHub Actions workflows become more powerful by using multiple jobs, dependencies, environment variables, outputs, and conditions.

Instead of running everything as one simple workflow, I learned how jobs can work together and make decisions based on previous results.

---

## Task 1 – Multi-Job Workflow

I created a workflow with three jobs:

- Build
- Test
- Deploy

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Build application
        run: echo "Building the app"

  test:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: Run tests
        run: echo "Running tests"

  deploy:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - name: Deploy application
        run: echo "Deploying"
```

The dependency chain was:

```text
Build → Test → Deploy
```

### What I learned

`needs:` creates a dependency between jobs.

For example:

```yaml
needs: build
```

This means the `test` job waits until the `build` job completes successfully.

Without `needs:`, jobs can run independently and potentially in parallel.

---

## Task 2 – Environment Variables

I tested environment variables at three different levels.

### Workflow Level

```yaml
env:
  APP_NAME: myapp
```

A workflow-level variable is available to all jobs and steps in the workflow.

### Job Level

```yaml
env:
  ENVIRONMENT: staging
```

A job-level variable is available to all steps inside that specific job.

### Step Level

```yaml
env:
  VERSION: "1.0.0"
```

A step-level variable is available only inside that particular step.

The workflow successfully printed:

```text
App: myapp
Environment: staging
Version: 1.0.0
```

I also used GitHub context values:

```yaml
${{ github.sha }}
${{ github.actor }}
```

These allowed the workflow to access information about the workflow run.

My workflow printed:

```text
Commit SHA: 495839d0541dca660853e6d29530c66553fa06a7
Triggered by: riyan-ahmed
```

This showed me that GitHub automatically provides useful information about the repository, commit, branch, actor, event, runner, and workflow.

---

## Task 3 – Passing Outputs Between Jobs

I created one job that generated the current date and passed it to another job.

```yaml
jobs:
  generate:
    runs-on: ubuntu-latest

    outputs:
      today: ${{ steps.set-date.outputs.date }}

    steps:
      - name: Set date
        id: set-date
        run: echo "date=$(date +%Y-%m-%d)" >> "$GITHUB_OUTPUT"

  display:
    needs: generate
    runs-on: ubuntu-latest

    steps:
      - name: Print date from previous job
        run: 'echo "Date: ${{ needs.generate.outputs.today }}"'
```

The second job successfully printed:

```text
Date: 2026-08-15
```

### How It Works

First, the step creates an output:

```bash
echo "date=$(date +%Y-%m-%d)" >> "$GITHUB_OUTPUT"
```

The job then exposes that step output:

```yaml
outputs:
  today: ${{ steps.set-date.outputs.date }}
```

The second job depends on the first job:

```yaml
needs: generate
```

It can then access the value using:

```yaml
${{ needs.generate.outputs.today }}
```

### Why Are Outputs Useful?

Jobs run in separate environments, so values created inside one job are not automatically available inside another job.

Outputs allow one job to pass useful information to another job.

Examples include:

- Docker image tags
- Version numbers
- Build IDs
- Artifact names
- Deployment information
- Generated file names

A common real-world example could be:

```text
Build Job
   ↓
Creates Docker image tag
   ↓
v1.2.3
   ↓
Deploy Job
   ↓
Deploys image v1.2.3
```

---

## Task 4 – Conditionals

I then explored how workflows can make decisions depending on things such as the branch, event type, or result of another step.

### Run Only on the Main Branch

I used:

```yaml
if: github.ref == 'refs/heads/main'
```

The step ran successfully because my workflow was triggered from the `main` branch.

The output was:

```text
This is the main branch
```

---

### Handling a Failed Step

I intentionally created a failing step:

```yaml
- name: Intentional failure
  id: demo
  run: exit 1
  continue-on-error: true
```

The command:

```bash
exit 1
```

normally tells GitHub Actions that the step failed.

The workflow showed:

```text
Error: Process completed with exit code 1.
```

However, because I used:

```yaml
continue-on-error: true
```

GitHub allowed the workflow to continue running instead of stopping immediately.

I then checked the actual outcome of that step:

```yaml
- name: Run after failure
  if: steps.demo.outcome == 'failure'
  run: echo "A previous step failed"
```

The next step successfully printed:

```text
A previous step failed
```

This helped me understand that a workflow can detect failures and react to them without always stopping the complete pipeline.

---

### Run a Job Only on Push

I also created a job with:

```yaml
if: github.event_name == 'push'
```

This means the job only runs when the workflow was triggered by a `push` event.

When I pushed my changes to GitHub, the `push-only` job ran successfully.

If the workflow had been triggered by a pull request instead, this job would have been skipped.

---

## Task 5 – Smart Pipeline

Finally, I combined the concepts from the day into a small pipeline.

The workflow contained three jobs:

```text
       Lint ──┐
              ├──→ Summary
       Test ──┘
```

The `lint` and `test` jobs had no dependency between them.

This means GitHub Actions can run them in parallel.

The `summary` job waits for both jobs:

```yaml
summary:
  needs:
    - lint
    - test
```

This means the flow becomes:

```text
Lint ──────┐
           │
           ├──→ Summary
           │
Test ──────┘
```

The summary job cannot begin until both `lint` and `test` have completed successfully.

---

## Detecting the Branch

Inside the summary job, I checked whether the workflow was running on the `main` branch.

```bash
if [ "${{ github.ref }}" = "refs/heads/main" ]; then
  echo "This is a main branch push"
else
  echo "This is a feature branch push"
fi
```

Because I pushed to `main`, the workflow printed:

```text
This is a main branch push
```

This type of logic can be useful in real pipelines where production deployments should happen only from specific branches.

For example:

```text
Feature Branch
      ↓
Build + Test

Main Branch
      ↓
Build + Test + Deploy
```

---

## Reading the Commit Message

I also accessed the commit message from the GitHub event.

```yaml
env:
  COMMIT_MESSAGE: ${{ github.event.commits[0].message }}

run: 'echo "Commit message: $COMMIT_MESSAGE"'
```

The workflow successfully printed:

```text
Commit message: Add Day 43 smart pipeline
```

GitHub Actions provides event information through contexts such as:

```text
github.actor
github.sha
github.ref
github.ref_name
github.event_name
github.event
```

These values can be used to make workflows behave differently depending on what triggered them.

---

## Understanding `needs:`

One of the most important things I learned today was how `needs:` controls dependencies between jobs.

For example:

```yaml
test:
  needs: build
```

means:

```text
Build
  ↓
Test
```

And:

```yaml
summary:
  needs:
    - lint
    - test
```

means:

```text
Lint ──┐
       ├──→ Summary
Test ──┘
```

Without `needs:`, jobs are independent and GitHub may run them at the same time.

With `needs:`, I can control the order of execution and create proper CI/CD pipelines.

---

## Understanding Job Outputs

Job outputs allow information generated in one job to be used by another job.

The basic flow is:

```text
Job A
  ↓
Step creates output
  ↓
Job exposes output
  ↓
Job B uses needs:
  ↓
Job B reads output
```

For example:

```yaml
${{ needs.generate.outputs.today }}
```

means:

- Look at the `generate` job
- Access its outputs
- Read the output called `today`

In a real CI/CD pipeline, this could be used for something such as:

```text
Build
  ↓
Generate image tag
  ↓
Pass image tag
  ↓
Deploy
```

---

## Day 43 Workflow Overview

The workflows I worked with today covered:

```text
Multi-Job Workflow
        ↓
Job Dependencies
        ↓
Environment Variables
        ↓
Job Outputs
        ↓
Conditionals
        ↓
continue-on-error
        ↓
Parallel Jobs
        ↓
Dependent Jobs
        ↓
Smart Pipeline
```

---

## Key Takeaways

Today I learned that GitHub Actions is not just about running commands after a push.

A workflow can contain multiple jobs, and those jobs can either run independently or depend on one another.

I learned how to use:

- `jobs`
- `steps`
- `needs:`
- Workflow-level environment variables
- Job-level environment variables
- Step-level environment variables
- `$GITHUB_OUTPUT`
- Job outputs
- GitHub contexts
- `if:` conditions
- `continue-on-error`
- Parallel jobs
- Dependent jobs
- Branch-based logic
- Event-based logic

The biggest takeaway for me was understanding how separate jobs communicate with each other and how `needs:` controls the flow of a pipeline.

Before this exercise, I mostly looked at workflows as a list of commands.

Now I understand them more like a pipeline:

```text
Trigger
   ↓
Independent Jobs
   ↓
Dependencies
   ↓
Conditions
   ↓
Outputs
   ↓
Next Job / Deployment
```

This is much closer to how GitHub Actions is used in real CI/CD pipelines.
