# Day 23 – Git Branching and GitHub

## What is a branch in Git?

A branch is an independent line of development that points to a commit. It allows changes to be developed without immediately affecting the main branch.

## Why use branches instead of committing everything to master?

Branches isolate features, fixes and experiments. This keeps the stable branch protected and allows changes to be reviewed and tested before they are merged.

## What is HEAD?

`HEAD` identifies the branch or commit currently checked out. In my branch output, the `*` showed which branch HEAD was pointing to.

## What happens to files when switching branches?

Git updates the working directory to match the selected branch. During my exercise, `feature-1-demo.md` existed on `feature-1` but disappeared when I switched to `master` because that commit was not part of master.

## `git switch` vs `git checkout`

`git switch` is focused specifically on changing and creating branches. `git checkout` is an older multi-purpose command that can switch branches and restore files. `git switch` makes the intention clearer.

## Origin vs upstream

- `origin` points to my fork: `riyan-ahmed/90DaysOfDevOps`.
- `upstream` points to the original repository: `TrainWithShubham/90DaysOfDevOps`.
- I push my work to `origin` and fetch project updates from `upstream`.

## Fetch vs pull

`git fetch` downloads remote commit and branch information without changing my current working files. `git pull` fetches remote changes and then integrates them into the current branch.

I tested this by adding a line through the GitHub editor. `git fetch` discovered commit `0dca50c`, while `git pull` applied it locally using a fast-forward update.

## Clone vs fork

A clone downloads a repository to my local computer. A fork creates my own server-side copy under my GitHub account.

I use clone when I need a local copy of a repository I can already work with. I use fork when contributing to a repository where I do not have direct write access.

## Keeping a fork synchronized

```bash
git switch master
git fetch upstream
git merge upstream/master
git push origin master