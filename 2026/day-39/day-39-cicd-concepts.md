# Day 39 – CI/CD Concepts

## Why CI/CD?

When multiple developers work on the same repository, different changes can conflict with each other or break the application.

Another common problem is "it works on my machine", where code works locally because the developer has the required libraries, dependencies, versions, or configuration, but it fails somewhere else.

Manual deployments also increase the chance of human error, especially when deployments happen frequently.

---

## CI vs Continuous Delivery vs Continuous Deployment

### Continuous Integration

Developers frequently integrate their code into a shared repository.

Whenever changes are pushed, the application is automatically built and tested so problems can be detected early.

Example:

Developer pushes code → Build → Test → Pass/Fail

### Continuous Delivery

After the code passes the build and tests, it is kept ready for production deployment.

The final production deployment normally requires manual approval.

Example:

Push → Build → Test → Ready for Production → Manual Approval → Deploy

### Continuous Deployment

Code that passes all required checks is automatically deployed to production without manual approval.

Example:

Push → Build → Test → Checks Pass → Production

---

## Pipeline Anatomy

- **Trigger** – the event that starts the pipeline, such as a code push or pull request.
- **Stage** – a major phase of the pipeline such as build, test, or deploy.
- **Job** – a unit of work performed inside the pipeline.
- **Step** – a smaller action or command that helps complete a job.
- **Runner** – the machine or VM that executes the job.
- **Artifact** – an output produced by a job that can be saved or used later.

---

## Pipeline Diagram

Developer Pushes Code
        ↓
GitHub
        ↓
Trigger: Push
        ↓
Test
        ↓
Build Docker Image
        ↓
Deploy to Staging

---

## Exploring a Real Workflow

I explored the FastAPI GitHub Actions workflow.

### Trigger

The workflow can run when:

- Code is pushed to the `master` branch
- A pull request is created or updated

### Jobs

The workflow contains jobs including:

- changes
- langs
- build-docs
- docs-all-green

### build-docs

The `build-docs` job builds the FastAPI documentation.

It checks out the code, prepares the environment, installs dependencies, builds the documentation, and uploads the generated documentation as an artifact.

### Artifact

The generated documentation is uploaded with a name similar to:

docs-site-${{ matrix.lang }}

This allows documentation for different languages to be stored separately.

---

## Key Takeaways

1. CI/CD is a practice used to automate how code is integrated, tested, prepared, and deployed.
2. CI helps detect problems early instead of waiting until deployment.
3. A failed pipeline is useful because it prevents potentially broken code from progressing further.
