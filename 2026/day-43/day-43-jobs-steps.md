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
