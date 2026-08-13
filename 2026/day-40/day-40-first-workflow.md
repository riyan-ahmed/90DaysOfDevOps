# Day 40 – My First GitHub Actions Workflow

Today I created and ran my first GitHub Actions workflow.

## Workflow

```yaml
name: Hello

"on":
  push:

jobs:
  greet:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Say hello
        run: echo "Hello from GitHub Actions!"

      - name: Print date and time
        run: date

      - name: Print branch name
        run: 'echo "Branch: ${{ github.ref_name }}"'

      - name: List repository files
        run: ls -la

      - name: Print runner OS
        run: 'echo "Runner OS: ${{ runner.os }}"'

## Successful Workflow Run

![Successful GitHub Actions workflow](images/day-40-workflow-green.png)
