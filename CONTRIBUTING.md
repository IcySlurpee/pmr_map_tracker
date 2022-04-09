# Contributing Back
No one person can make an amazing tracker - that's why you can help make it better!  From code, to data, or images: all contributions are welcome!  When you contribute, you need to follow some guidelines.

- [Bug Reports and Feature Requests](#issue)
- [Submitting a Pull Request](#pr)
- [Commit Message Guidelines](#commits)

## <a name="issue"></a> Submitting an Issue
Before you submit an issue, please search the issues page for open and closed issues.  Your issue may have already been reported and discussion already started.

### Bug Reports
In order to get your issue fixed as quickly as possible, when you submit an issue, please provide a save file of your tracker (Cogwheel -> Application -> File -> Save or Ctrl+S) and your seed settings string.

Please note: issues that remain inactive for extended periods of time may be closed if there's no response from the reporter.

If you would like to fix a bug, you may submit a pull request instead.

### Feature Requests
You may request a new feature by submitting an issue to this repo.  After a feature request has been opened and reviewed, if accepted, work can be tracked via the project board.

If you would like to _implement_ a new feature, you may submit a pull request instead.

## <a name="pr"></a> Submitting a Pull Request (PR)
1. [Fork](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) the repo.
2. In your forked repository, switch to a new branch:
    ```
    git switch -c my-branch-name main
    ```
3. Make your changes.
4. Commit your changes using a descriptive commit message that follows the [commit message guidelines](#commits):
    ```
    git commit --all
    ```
5. Push your branch:
    ```
    git push origin my-branch-name
    ```
6. On Github, send a pull request to `pmr_map_tracker:main`.

### Addressing feedback
If a reviewer has asked for changes, then:
1. Make any updates that were requested.
2. Create a fixup commit and push to your Github repo (this will auto-update your PR):
    ```
    git commit --all --fixup HEAD
    git push
    ```
    If you're not using git on the command line, the only thing that differentiates a fixup commit from a regular commit is prepending: `fixup! ` (notice the space) to the original commit message's header.

    If you want to know more about fixup commits, [AngularJS's documentation](https://github.com/angular/angular/blob/2006f53b48449aa97236bf7955dea3f795092351/docs/FIXUP_COMMITS.md) has a great write-up about them.

### Updating the commit message
A reviewer might suggest changes to the commit message, like adding more context to a change or editing to adhere to the commit message guidelines.  In order to update the commit message of the **most recent** commit on your branch:
1. Check out your branch.
    ```
    git checkout my-branch-name
    ```
2. Amend the last commit and change the message:
    ```
    git commit --amend
    ```
3. Push to your repository (this will auto-update your PR):
    ```
    git push --force-with-lease
    ```

If you need to update the commit message of an earlier commit, you can use `git rebase -i` to [interactively rebase](https://git-scm.com/docs/git-rebase#_interactive_mode) your branch allowing you to `reword` previous commits.

Instructions to interactively rebase for GUI git applications differ depending on the program.

### After your PR is merged
Once your PR is merged into `main`, you can safely delete your local branch and pull your changes into your local clone.
1. Delete the remote branch on Github via the web UI or via your shell:
    ```
    git push origin --delete my-branch-name
    ```
2. Checkout the main branch
    ```
    git switch main -f
    ```
3. Delete your local branch
    ```
    git branch -D my-branch-name
    ```
4. Pull the latest from upstream
    ```
    git pull --ff upstream main
    ```

## <a name="commits"></a> Commit Messages
It's best to keep things simple, but there's one thing that that's required when contributing.  This repository requires contributors to follow precise rules for commit messages as it helps develop an easier to read commit history.

A good commit message not only explains the _what_ but also the _why_; your submitted code will explain the _how_.

This repo follows a commit message structure inspired by [multiple](https://github.com/kubernetes/community/blob/a4873c6e8c85204e390a953b6e0d61f4c08f37a6/contributors/guide/pull-requests.md#commit-message-guidelines) [open-source](https://go.dev/doc/contribute#commit_messages) [software](https://github.com/angular/angular/blob/2006f53b48449aa97236bf7955dea3f795092351/CONTRIBUTING.md#commit) [projects](https://www.electronjs.org/docs/latest/development/pull-requests#commit-message-guidelines) [and](https://cbea.ms/git-commit/) [standards](https://www.conventionalcommits.org/en/v1.0.0/).

```
<header>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The `header` is required and must follow the [message header format](#header).  Try to keep the header under 50 characters; Github knows about this convention and the web UI will notify you when you've gone over.

The `body` is optional; if included, should be at least 20 characters.  Please consider adding a commit message body, as it will allow you to explain why you made this change and your motivations behind the change.  Messages in bug fix commits are especially useful if they contained information about the behavior before the change.

The `footer` is optional; if included, can contain links to issues that this commit will close.  You can [close a PR via commit message](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword) with words like `fix`, `fixes`, `close`, or `closes`, followed by the issue number prefixed with a `#`: for example, `fixes #14`.

### <a name="header"></a> Commit message header format
```
<type>(<scope>): <short summary>
  |       |             |
  |       |             └─≫ summary in present tense, not capitalized, no period at the end.
  |       |
  |       └─≫ commit scope: prlg|ch1|ch2|ch3|ch4|ch5|ch6|ch7|ch8|
  |                         check|item|layout|logic|map|script
  |
  └─≫ commit type: chore|docs|feat|fix|refactor
```

#### Type
Must be one of the following:
- `chore`: changes that do not touch any user-facing code, ex. repo settings, templates, etc.
- `docs`: changes that involve updating documentation like `README.md` or `CHANGELOG.md`.
- `feat`: a new feature
- `fix`: a bug fix
- `refactor`: a change that is neither a new feature nor a bug fix

#### Scope
The scope should be the area your change affects. Use `logic` for generalized logic fixes, like a new randomization option, or logic overhaul; or the `ch<#>` scopes for fixes targeting a specific chapter.

### Revert Commits
If your PR reverts a previous commit, simply add `revert: ` (note the space) to the beginning of the header of the commit you're reverting.

### Example commit message
```
feat(logic): add koopa koot shuffle support

Adds koopa koot shuffle support with a progressive item that denotes
the current koopa koot step.  Standard logic ties the items to their
relevant checks.

A progressive item was chosen instead of individual flags to reduce
complexity and because the rando dev team is not currently randomizing
the steps themselves.  If the steps themselves were to be randomized,
this would need to be refactored.

Closes #123
```
