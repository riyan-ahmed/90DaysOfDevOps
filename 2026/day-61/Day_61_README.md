# Day 61 – Terraform Basics & AWS Infrastructure as Code

## Overview

Today I worked with **Terraform** to understand the fundamentals of **Infrastructure as Code (IaC)**.

The goal was to configure Terraform with AWS, create an S3 bucket using code, inspect Terraform state, verify the deployed resource, and safely destroy the infrastructure.

This lab helped me understand the complete Terraform lifecycle from configuration to cleanup.

---

## What is Infrastructure as Code?

Infrastructure as Code, or **IaC**, is the practice of managing infrastructure using configuration files instead of manually creating resources through a cloud console.

IaC makes infrastructure:

- Repeatable
- Version controlled
- Automated
- Consistent
- Reproducible
- Easier to review
- Less prone to human error

Terraform is a **declarative** IaC tool, meaning we describe the desired infrastructure state and Terraform determines the actions required to achieve it.

Terraform is also **cloud-agnostic**, allowing infrastructure to be managed across platforms such as:

- AWS
- Azure
- Google Cloud
- Kubernetes
- GitHub
- Cloudflare

---

## Terraform vs Other Tools

### Terraform

Used primarily for infrastructure provisioning and supports multiple cloud providers.

### AWS CloudFormation

AWS-native Infrastructure as Code service mainly focused on AWS resources.

### Ansible

Primarily used for configuration management, application setup, and system automation.

### Pulumi

Provides Infrastructure as Code using general-purpose programming languages such as Python, TypeScript, Go, and C#.

---

## Environment

```text
Terraform v1.15.8
AWS CLI v2.36.5
macOS ARM64
AWS Region: eu-west-2
```

---

## Architecture

```text
┌───────────────────────┐
│      MacBook Pro      │
│                       │
│  Terraform + AWS CLI  │
└───────────┬───────────┘
            │
            │ AWS Provider
            ▼
┌───────────────────────┐
│          AWS          │
│      eu-west-2        │
│                       │
│   ┌───────────────┐   │
│   │   S3 Bucket   │   │
│   │               │   │
│   │ day61_bucket  │   │
│   └───────────────┘   │
└───────────────────────┘
```

Terraform used the AWS provider to authenticate with AWS and provision an S3 bucket in the `eu-west-2` region.

---

## 1. Verified Terraform Installation

Checked the installed Terraform version:

```bash
terraform --version
```

Output:

```text
Terraform v1.15.8
on darwin_arm64
```

---

## 2. Verified AWS CLI

Checked the AWS CLI installation:

```bash
aws --version
```

Output:

```text
aws-cli/2.36.5
```

---

## 3. Verified AWS Authentication

Confirmed that my AWS CLI credentials were working:

```bash
aws sts get-caller-identity
```

This verified that my local environment could authenticate and communicate with AWS.

---

## 4. Created Terraform Configuration

Created the Terraform configuration file:

```bash
touch main.tf
```

Added:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "day61_bucket" {
  bucket = "riyan-day61-terraform-bucket"
}
```

This configuration defines:

- Terraform AWS provider
- AWS region
- S3 bucket resource
- Desired infrastructure state

---

## 5. Initialised Terraform

Ran:

```bash
terraform init
```

`terraform init` prepared the working directory and downloaded the required AWS provider.

---

## 6. Formatted the Configuration

Ran:

```bash
terraform fmt
```

This automatically formatted the Terraform configuration according to Terraform standards.

---

## 7. Validated the Configuration

Ran:

```bash
terraform validate
```

Output:

```text
Success! The configuration is valid.
```

This confirmed that the Terraform configuration was syntactically valid.

---

## 8. Generated an Execution Plan

Ran:

```bash
terraform plan
```

Terraform generated a preview of the infrastructure changes.

Example:

```text
Plan: 1 to add, 0 to change, 0 to destroy.
```

This step is important because it allows infrastructure changes to be reviewed before deployment.

---

## 9. Provisioned AWS Infrastructure

Applied the Terraform configuration:

```bash
terraform apply
```

After reviewing the execution plan, confirmed the deployment.

Terraform then created the S3 bucket in AWS.

---

## 10. Verified the AWS Resource

Verified that the bucket existed:

```bash
aws s3 ls | grep riyan-day61-terraform-bucket
```

Output:

```text
2026-09-25 15:57:02 riyan-day61-terraform-bucket
```

This confirmed that the infrastructure defined in Terraform had been successfully provisioned in AWS.

---

## 11. Inspected Terraform State

Listed resources Terraform was tracking:

```bash
terraform state list
```

Output:

```text
aws_s3_bucket.day61_bucket
```

Inspected the resource state:

```bash
terraform state show aws_s3_bucket.day61_bucket
```

Terraform state creates the link between the resources defined in configuration files and the actual resources deployed in AWS.

---

## 12. Destroyed the Infrastructure

Removed the test infrastructure using:

```bash
terraform destroy
```

After reviewing the destruction plan, confirmed the operation.

Terraform safely removed the S3 bucket it had previously created.

---

## 13. Verified Cleanup

Checked whether the bucket still existed:

```bash
aws s3 ls | grep riyan-day61-terraform-bucket
```

No output confirmed that the resource had been successfully deleted.

---

## Terraform Lifecycle

```text
Write Infrastructure Code
          ↓
   terraform init
          ↓
    terraform fmt
          ↓
 terraform validate
          ↓
   terraform plan
          ↓
   terraform apply
          ↓
   AWS Infrastructure
          ↓
 Terraform State Tracking
          ↓
 terraform destroy
```

---

## Key Commands Learned

```bash
terraform --version
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform state list
terraform state show
terraform destroy

aws --version
aws sts get-caller-identity
aws s3 ls
```

---

## Key Concepts Learned

- Infrastructure as Code
- Terraform providers
- Terraform resources
- Declarative infrastructure
- Cloud-agnostic provisioning
- AWS authentication
- Terraform execution plans
- Terraform state
- Infrastructure lifecycle management
- Infrastructure provisioning
- Infrastructure cleanup

---

## Real-World DevOps Relevance

This lab reflects a simplified version of how infrastructure is managed in real DevOps environments.

Instead of manually creating cloud resources through the AWS Console, infrastructure can be stored as code in Git and managed through repeatable Terraform workflows.

In production, the same approach can be used to provision:

- VPCs and subnets
- EC2 instances
- Load balancers
- IAM resources
- S3 buckets
- RDS databases
- EKS clusters
- Security groups
- Monitoring infrastructure

Terraform configurations can also be integrated into **CI/CD pipelines**, allowing teams to automatically validate and review infrastructure changes before deployment.

Using Infrastructure as Code also improves collaboration because infrastructure changes can go through the same workflow as application code:

```text
Developer
   ↓
Terraform Code
   ↓
Git Commit
   ↓
Pull Request
   ↓
terraform fmt / validate / plan
   ↓
Code Review
   ↓
terraform apply
   ↓
AWS Infrastructure
```

This makes cloud infrastructure more consistent, auditable, and easier to maintain across development, staging, and production environments.

---

## What I Learned

The biggest takeaway from Day 61 was understanding how Terraform manages the complete infrastructure lifecycle.

I defined an AWS resource using HCL, initialised the Terraform environment, validated the configuration, reviewed an execution plan, provisioned the infrastructure, inspected Terraform state, and safely destroyed the resource.

The exercise demonstrated why Infrastructure as Code is fundamental to modern DevOps: infrastructure becomes **repeatable, version-controlled, reviewable, automated, and easier to reproduce across environments**.

## Day 61 Complete ✅

Successfully completed **Terraform Fundamentals & AWS Infrastructure as Code** as part of my **90 Days of DevOps** journey.
