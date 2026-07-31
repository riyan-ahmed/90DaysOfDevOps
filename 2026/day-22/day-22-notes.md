# Day 22 – Introduction to Git

## 1. What is the difference between `git add` and `git commit`?

`git add` places selected changes into the staging area. `git commit` records those staged changes as a permanent snapshot in the repository’s history.

## 2. What does the staging area do?

The staging area lets me choose exactly which changes should be included in the next commit. This is useful when I have changed several files but only want to commit related changes together.

## 3. What information does `git log` show?

`git log` displays the commit history, including the commit hash, author, date and commit message. Options such as `--oneline` provide a shorter view.

## 4. What is the `.git` directory?

The `.git` directory stores the repository’s metadata, objects, branches, configuration and commit history. Deleting it removes the repository’s Git history and tracking, although the normal project files remain.

## 5. Working directory, staging area and repository

- **Working directory:** The files I am currently creating or editing.
- **Staging area:** The selected changes prepared for the next commit.
- **Repository:** The committed snapshots stored permanently in Git history.

## Practical observations

- `git status` shows the current state of the repository.
- Untracked files are not included in commits automatically.
- Staging allows commits to stay focused and meaningful.
- `git log --oneline` provides a compact view of commit history.


