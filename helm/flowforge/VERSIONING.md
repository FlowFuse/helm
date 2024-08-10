## Overview

In this project, the `@semantic-release/commit-analyzer` is used to automatically determine the next helm chart release version based on the commit messages in the codebase. This plugin is part of the Semantic Release suite, which automates the versioning and publishing process based on the commit history.

By using the Angular commit message convention (also known as [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)), the project adheres to a standardized format for commit messages, which the `@semantic-release/commit-analyzer` plugin uses to determine whether the next release should be a major, minor, or patch release.

## Components

1. `@semantic-release/commit-analyzer`:

    * A Semantic Release plugin that analyzes commit messages to determine the type of release required.
    * It examines the commit messages since the last release and decides if the version should be bumped according to Semantic Versioning (SemVer).

2. Angular Preset:
    * The Angular preset follows the Conventional Commits specification, which is widely used in the Angular community.
    * Commit messages must follow a specific format, which indicates the type of change (e.g., feature, bug fix, breaking change).


## Commit Message Format

The Angular preset expects commit messages to be in the following format:

```
<type>(<scope>): <subject>

<body>

<footer>
```

* Type: Describes the category of the commit. Examples include:
    * `feat`: A new feature (triggers a minor version bump).
    * `fix`: A bug fix (triggers a patch version bump).
    * `perf`: A code change that improves performance (triggers a patch version bump).
    * `refactor`: A code change that neither fixes a bug nor adds a feature (does not trigger a release unless it's accompanied by a BREAKING CHANGE).
    * `docs`: Documentation-only changes (does not trigger a release).
    * `chore`: Changes to the build process or auxiliary tools and libraries (does not trigger a release).
* Scope: An optional part that provides additional context about what was changed (e.g., module, component).
* Subject: A brief description of the changes.
* Body (optional): More detailed explanation of the change.
* Footer (optional): Used to include any information about breaking changes or issues closed by the commit. A BREAKING CHANGE clause here will trigger a major version bump.

#### Handling Breaking Changes

If the commit body or footer contains the terms `BREAKING CHANGE`, `BREAKING CHANGES`, or `BREAKING`, the `@semantic-release/commit-analyzer` plugin will trigger a major version bump. 
This indicates that the changes are not backward-compatible and require careful consideration by consumers of the software.

#### Example Commit Messages

* `feat(authentication): add OAuth2 login support`
* `fix(user-profile): correct profile picture upload issue`
* `perf(database): optimize query performance`
* `chore(deps): update dependency versions`
* `refactor(api): change response structure
   BREAKING CHANGE: The response structure of the /users endpoint has been modified.`
