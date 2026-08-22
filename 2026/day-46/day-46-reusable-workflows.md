# Day 46 – Reusable Workflows & Composite Actions

Today I learned how GitHub Actions can avoid duplicated workflow code by using **Reusable Workflows** and **Composite Actions**.

The main idea is similar to using functions or methods in programming:

```text
Write logic once
      ↓
Reuse it many times
      ↓
Pass inputs
      ↓
Receive outputs
```

Instead of copying the same build, test, or setup steps into several workflow files, I can define the logic once and call it wherever required.

---

## Task 1 – Understanding Reusable Workflows

A reusable workflow is a normal GitHub Actions workflow that can be called by another workflow.

The important trigger is:

```yaml
"on":
  workflow_call:
```

Unlike:

```yaml
"on":
  push:
```

or:

```yaml
"on":
  workflow_dispatch:
```

`workflow_call` means the workflow waits for another workflow to call it.

I think of it like a function in programming:

```text
Programming                GitHub Actions
-----------                --------------
Function             →     Reusable Workflow
Parameters           →     Inputs
Return Values        →     Outputs
Function Call        →     uses:
```

This helps reduce duplicated YAML and makes CI/CD pipelines easier to maintain.

---

# Task 2 – Creating a Reusable Workflow

I created:

```text
.github/workflows/reusable-build.yml
```

The workflow accepts:

- Application name
- Environment
- Docker token

The reusable workflow begins with:

```yaml
"on":
  workflow_call:
    inputs:
      app_name:
        description: Application name
        required: true
        type: string

      environment:
        description: Deployment environment
        required: true
        default: staging
        type: string

    secrets:
      docker_token:
        required: true
```

This is similar to defining parameters for a function.

For example:

```text
reusable-build(
    app_name,
    environment,
    docker_token
)
```

---

## Using the Inputs

Inside the reusable workflow, I accessed the inputs using:

```yaml
${{ inputs.app_name }}
${{ inputs.environment }}
```

The build job included:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Print build information
        run: |
          echo "Building ${{ inputs.app_name }}"
          echo "Environment: ${{ inputs.environment }}"
```

The values are not hard-coded inside the reusable workflow.

Instead, the calling workflow decides which values should be passed.

---

## Passing Secrets

The reusable workflow also accepts a Docker token:

```yaml
secrets:
  docker_token:
    required: true
```

Inside the job, I verified that the secret was available without displaying its value:

```yaml
- name: Check Docker token
  env:
    DOCKER_TOKEN: ${{ secrets.docker_token }}
  run: |
    if [ -n "$DOCKER_TOKEN" ]; then
      echo "Docker token is set: true"
    else
      echo "Docker token is set: false"
    fi
```

The workflow successfully printed:

```text
Docker token is set: true
```

This proved that the secret was passed correctly.

---

# Task 3 – Calling the Reusable Workflow

Next I created:

```text
.github/workflows/call-build.yml
```

The caller workflow contained:

```yaml
jobs:
  build:
    uses: ./.github/workflows/reusable-build.yml

    with:
      app_name: my-web-app
      environment: production

    secrets:
      docker_token: ${{ secrets.DOCKER_TOKEN }}
```

The caller passes:

```text
app_name     → my-web-app
environment  → production
docker_token → GitHub Secret
```

The reusable workflow receives those values and executes its job.

The flow is:

```text
call-build.yml
      ↓
passes inputs + secret
      ↓
reusable-build.yml
      ↓
build job
```

---

## Successful Reusable Workflow Run

The workflow printed:

```text
Building my-web-app
Environment: production
```

It also confirmed:

```text
Docker token is set: true
```

This showed that the caller workflow successfully passed both normal inputs and a secret to the reusable workflow.

---

# Task 4 – Returning Outputs

Reusable workflows can also return information back to the caller.

I generated a build version using the short Git commit SHA.

The generated value followed this format:

```text
v1.0-<short-sha>
```

For example:

```text
v1.0-6df2f0b
```

---

## Step Output

The first stage was generating the value inside a step:

```yaml
- name: Generate build version
  id: version
  run: |
    short_sha="$(git rev-parse --short HEAD)"
    echo "build_version=v1.0-${short_sha}" >> "$GITHUB_OUTPUT"
```

This creates a step output called:

```text
build_version
```

---

## Job Output

The job then exposes the step output:

```yaml
outputs:
  build_version: ${{ steps.version.outputs.build_version }}
```

---

## Workflow Output

The reusable workflow exposes the job output:

```yaml
outputs:
  build_version:
    description: Generated build version
    value: ${{ jobs.build.outputs.build_version }}
```

The complete output chain becomes:

```text
Step Output
     ↓
Job Output
     ↓
Reusable Workflow Output
     ↓
Caller Workflow
```

---

## Reading the Output in the Caller

The caller workflow contained another job:

```yaml
show-version:
  needs: build
  runs-on: ubuntu-latest

  steps:
    - name: Print returned build version
      run: 'echo "Build version: ${{ needs.build.outputs.build_version }}"'
```

The workflow successfully printed:

```text
Build version: v1.0-6df2f0b
```

This proved that a value generated inside a reusable workflow could be returned to the workflow that called it.

---

# Task 5 – Composite Actions

Next I learned about **Composite Actions**.

A composite action allows several steps to be grouped together and reused as one action.

I created:

```text
.github/actions/setup-and-greet/action.yml
```

The action accepts two inputs:

```yaml
inputs:
  name:
    description: Name to greet
    required: true

  language:
    description: Greeting language
    required: false
    default: en
```

---

## Composite Action Steps

The composite action contained multiple shell steps:

```yaml
runs:
  using: composite

  steps:
    - name: Print greeting
      id: greet
      shell: bash
      run: |
        if [ "${{ inputs.language }}" = "en" ]; then
          echo "Hello, ${{ inputs.name }}!"
        else
          echo "Hi, ${{ inputs.name }}!"
        fi

        echo "greeted=true" >> "$GITHUB_OUTPUT"

    - name: Show runner information
      shell: bash
      run: |
        echo "Date: $(date)"
        echo "Runner OS: $RUNNER_OS"
```

The important declaration is:

```yaml
runs:
  using: composite
```

This tells GitHub that the action contains multiple reusable steps.

---

## Composite Action Output

The action also returns:

```yaml
outputs:
  greeted:
    description: Whether greeting completed
    value: ${{ steps.greet.outputs.greeted }}
```

The output value is:

```text
true
```

---

# Calling the Composite Action

I created:

```text
.github/workflows/composite-demo.yml
```

First, the repository is checked out:

```yaml
- name: Checkout code
  uses: actions/checkout@v4
```

This is required because the composite action exists inside the repository.

The workflow then calls the local action:

```yaml
- name: Run setup and greet action
  id: greeting
  uses: ./.github/actions/setup-and-greet

  with:
    name: Riyan
    language: en
```

This is similar to calling a reusable function.

---

## Composite Action Result

The workflow successfully printed:

```text
Hello, Riyan!
```

It also printed the runner information:

```text
Date: Sat Aug 22 10:48:05 UTC 2026
Runner OS: Linux
```

Finally, the workflow read the output:

```yaml
- name: Print action output
  run: 'echo "Greeted: ${{ steps.greeting.outputs.greeted }}"'
```

The result was:

```text
Greeted: true
```

This confirmed that:

```text
Workflow
   ↓
Composite Action
   ↓
Multiple Steps
   ↓
Output
   ↓
Workflow
```

worked correctly.

---

# Reusable Workflow vs Composite Action

Although both help reduce duplicated code, they operate at different levels.

| Reusable Workflow | Composite Action |
|---|---|
| Uses `workflow_call` | Uses `runs: using: composite` |
| Called as a job | Called as a step |
| Can contain multiple jobs | Cannot contain jobs |
| Can contain multiple steps | Can contain multiple steps |
| Located in `.github/workflows/` | Usually stored in `.github/actions/` |
| Can receive workflow secrets | Values can be passed through inputs/env |
| Good for complete CI/CD processes | Good for reusable groups of steps |

The easiest way I understand the difference is:

```text
Reusable Workflow
= reuse jobs or a larger pipeline

Composite Action
= reuse a smaller collection of steps
```

---

# My Programming Analogy

I found it easier to understand these concepts by comparing them with programming.

```text
Application
    ↓
Function
    ↓
Smaller helper function
```

is similar to:

```text
GitHub Actions Workflow
          ↓
Reusable Workflow
          ↓
Composite Action
```

For example:

```text
Main CI Workflow
      ↓
Reusable Build Workflow
      ↓
Composite Setup Action
```

Each level can reuse logic without repeating the implementation.

---

# Why Reusability Matters

Without reusable components, several repositories might contain:

```text
Repository A
  checkout
  setup
  build
  test

Repository B
  checkout
  setup
  build
  test

Repository C
  checkout
  setup
  build
  test
```

The same logic has now been copied three times.

If the build process changes, all three workflows may need to be updated.

With reusable workflows:

```text
Repository A ──┐
Repository B ──┼──→ Reusable Build Workflow
Repository C ──┘
```

The logic can be maintained in one place.

This can improve:

- Consistency
- Maintainability
- Standardisation
- Reusability
- CI/CD management

---

# Day 46 Workflow Structure

The practical work for today resulted in:

```text
.github/
│
├── workflows/
│   ├── reusable-build.yml
│   ├── call-build.yml
│   └── composite-demo.yml
│
└── actions/
    └── setup-and-greet/
        └── action.yml
```

---

# Full Mental Model

The main concepts I practised today were:

```text
Normal Workflow
      ↓
Calls Reusable Workflow
      ↓
Passes Inputs
      ↓
Passes Secrets
      ↓
Reusable Workflow Executes
      ↓
Creates Output
      ↓
Returns Output
      ↓
Caller Uses Output
```

For composite actions:

```text
Workflow Step
      ↓
uses: local composite action
      ↓
Composite Action
      ↓
Step 1
Step 2
Step 3
      ↓
Returns Output
```

---

# Key Takeaways

Today I learned that GitHub Actions workflows do not need to contain duplicated YAML.

Reusable workflows allow me to reuse complete jobs or pipeline logic.

Composite actions allow me to package several related steps together and reuse them as one action.

The key concepts I practised were:

- `workflow_call`
- Reusable workflows
- Workflow inputs
- Reusable workflow secrets
- Step outputs
- Job outputs
- Workflow outputs
- Calling reusable workflows with `uses:`
- `needs:`
- Composite actions
- `runs: using: composite`
- Composite action inputs
- Composite action outputs
- Local actions

The biggest takeaway for me is that reusable workflows work very similarly to functions or methods in programming.

Instead of copying the same CI/CD logic everywhere, I can define it once and reuse it.

```text
Write Once
    ↓
Pass Inputs
    ↓
Execute
    ↓
Return Outputs
    ↓
Reuse Anywhere
```

This makes larger GitHub Actions pipelines much easier to maintain.
