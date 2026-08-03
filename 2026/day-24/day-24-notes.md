# Day 24 – Advanced Git Workflow

## Fast-forward merge

A fast-forward merge happens when the target branch has no new commits. Git simply moves the branch pointer forward.

Example:

master:
A

feature:
A → B

After merge:

master:
A → B


## Three-way merge

A three-way merge happens when both branches have new commits after a common ancestor.

Git compares:

- Common ancestor
- Current branch changes
- Incoming branch changes

It creates a merge commit.

## Merge conflicts

A conflict happens when Git cannot automatically decide between two changes, usually when the same part of a file is modified differently.

Conflict markers:

<<<<<<< HEAD
current branch
=======
incoming branch
>>>>>>> branch-name


## Rebase

Rebase moves feature commits on top of the latest base branch.

Benefits:

- Cleaner linear history
- Avoids unnecessary merge commits

Important:

Rebase creates new commit hashes because commits are recreated.


## Squash merge

Squash combines multiple feature commits into one commit before merging into master.

Benefits:

- Cleaner project history
- Fewer unnecessary commits


## Git stash

Git stash temporarily stores unfinished changes without committing.

Commands:

git stash

Stores tracked changes.

git stash -u

Stores tracked and untracked changes.

git stash list

Shows saved stashes.

git stash pop

Restores changes and removes the stash.

git stash apply

Restores changes but keeps the stash.


## Cherry-pick

Cherry-pick copies one specific commit from another branch.

It creates a new commit with a new hash containing the same changes.

Example:

git cherry-pick <commit-hash>