# GitHub autoflake Action

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


### Example

This is a simple usage example of this script:

```yaml
# This action works with pull requests and pushes
name: Continuous Integration

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
    - uses: creyD/autoflake_action@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

```

## Issues

Please report all bugs and feature request using the [GitHub issues function](https://github.com/creyD/autoflake_action/issues/new).

## FAQ

### Repository workflow settings

To be able to push to your repository you will need to enable "Read and write permissions" for your repository. You can find these settings in the settings of the repository under Actions > General > Workflow Permissions.

![Workflow Permissions](https://github.com/creyD/autoflake_action/assets/15138480/05d5d993-970f-4835-bfeb-2d067afcf352)

If you do not set this, you might encounter this issue:

![Sample error message](https://github.com/creyD/autoflake_action/assets/15138480/e71c814f-e7e9-4636-973b-750d6b950b84)
