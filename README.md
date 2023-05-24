# GitHub autoflake Action

[![License MIT](https://img.shields.io/github/license/creyD/autoflake_action)](https://github.com/creyD/autoflake_action/blob/master/LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/creyD/autoflake_action)](https://github.com/creyD/autoflake_action/releases)
[![Contributors](https://img.shields.io/github/contributors-anon/creyD/autoflake_action)](https://github.com/creyD/autoflake_action/graphs/contributors)
[![Issues](https://img.shields.io/github/issues/creyD/autoflake_action)](https://github.com/creyD/autoflake_action/issues)

This GitHub action automatically removes unused imports and variables from your Python code using [autoflake](https://pypi.org/project/autoflake/).

## Usage
### Parameters
The following parameters can be used in your custom action configuration.

| Parameter | Required | Default | Description |
| - | - | - | - |
| commit_message | :x: | 'Removed unused imports and variables' | Custom git commit message |
| commit_options | :x: | - | Custom git commit options |
| file_pattern | :x: | '&ast;' | Custom file pattern for `git add` |
| checkpath | :x: | '.' | The path autoflake checks |
| no_commit | :x: | False | Avoid committing, if used in a pipeline |
| options | :x: | ' ' | Parameters to use with autoflake |
| dry | :x: | false | Dry-run the action to fail when detecting uncompliant files, instead of automatically fixing them. |
| github_token | :x: | `${{ github.token }}` | The default [GITHUB_TOKEN](https://docs.github.com/en/actions/reference/authentication-in-a-workflow#about-the-github_token-secret) or a [Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)

> Note: using the same_commit option may lead to problems if other actions are relying on the commit being the same before and after the prettier action has ran. Keep this in mind.

### Example

This is a simple usage example of this script:

```yaml
name: autoflake format

on:
  pull_request:
  push:
    branches:
    - master

jobs:
  format:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - uses: creyD/autoflake_action@v1.1
      with:
          options: --in-place --remove-all-unused-imports -r
```

More documentation for writing a workflow can be found [here](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions).

## Issues

Please report all bugs and feature request using the [GitHub issues function](https://github.com/creyD/autoflake_action/issues/new).

## FAQ

### Repository workflow settings

To be able to push to your repository you will need to enable "Read and write permissions" for your repository. You can find these settings in the settings of the repository under Actions > General > Workflow Permissions.

![Workflow Permissions](https://github.com/creyD/autoflake_action/assets/15138480/05d5d993-970f-4835-bfeb-2d067afcf352)

If you do not set this, you might encounter this issue:

![Sample error message](https://github.com/creyD/autoflake_action/assets/15138480/e71c814f-e7e9-4636-973b-750d6b950b84)
