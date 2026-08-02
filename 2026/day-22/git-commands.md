# My Git Commands Reference

## Setup & Configuration

### `git --version`
Shows the installed Git version.

Example:

git --version

### `git config --global user.name`
Displays or sets the name attached to commits.

Example: `git config --global user.name "Riyan Ahmed"`

### `git config --global user.email`
Displays or sets the email attached to commits.

Example: `git config --global user.email "your-email@example.com"`

## Basic Workflow

### `git init`
Initializes a directory as a Git repository.

Example: `git init`

### `git status`
Shows the current branch and state of files.

Example: `git status`

### `git add`
Adds changes to the staging area.

Example: `git add git-commands.md`

### `git commit`
Records staged changes in Git history.

Example: `git commit -m "Add initial Git commands reference"`

## Viewing Changes

### `git diff`
Shows unstaged changes.

Example: `git diff`

### `git diff --staged`
Shows changes currently staged for the next commit.

Example: `git diff --staged`

### `git log --oneline`
Displays commit history in a compact format.

Example: `git log --oneline`

### `git log`
Displays detailed commit history, including author, date and message.

Example: `git log`

### `git show`
Displays the details and changes introduced by a commit.

Example: `git show d05fa4a`

### `git restore --staged`
Removes a file from the staging area without deleting its changes.

Example: `git restore --staged git-commands.md`

## Branching

### `git branch`
Lists local branches.

Example: `git branch`

### `git branch <branch-name>`
Creates a new branch without switching to it.

Example: `git branch feature-1`

### `git switch <branch-name>`
Switches to an existing branch.

Example: `git switch feature-1`

### `git switch -c <branch-name>`
Creates a new branch and switches to it.

Example: `git switch -c feature-2`

### `git branch -d <branch-name>`
Safely deletes a local branch.

Example: `git branch -d feature-2`

### `git branch -a`
Lists local and remote branches.

Example: `git branch -a`

## Remote Repositories

### `git remote -v`
Shows the configured remote names and addresses.

Example: `git remote -v`

### `git push -u origin <branch-name>`
Pushes a branch to GitHub and connects the local branch to it.

Example: `git push -u origin feature-1`