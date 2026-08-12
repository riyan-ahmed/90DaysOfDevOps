# Day 38 – YAML Basics

Today I learned the fundamentals of YAML and how it is used to structure configuration files.

## person.yaml

```yaml
---
name: Riyan Ahmed
role: DevOps and Cloud Engineer
experience_years: 1.5
learning: true

tools:
  - Linux
  - Git
  - Docker
  - Kubernetes
  - AWS

hobbies: [gym, travelling, learning]
```

## server.yaml

```yaml
---
server:
  name: web-server
  ip: 192.168.1.10
  port: 8080

database:
  host: localhost
  name: devopsdb
  credentials:
    user: admin
    password: password123

startup_script: |
  echo "Starting server"
  sudo apt update
  echo "Server ready"
```

## What I Learned

1. YAML uses indentation to define structure, so spaces must be used correctly.
2. YAML lists can be written using `-` on separate lines or inline using `[item1, item2]`.
3. `|` preserves line breaks in multi-line strings, while `>` folds multiple lines into one.
