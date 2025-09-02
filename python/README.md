# Python Starter

Build your Temporal application in Python ([docs](https://docs.temporal.io/develop/python))

<!-- toc -->

* [Overview](#overview)
* [Quick start](#quick-start)
  * [Workflow](#workflow)
  * [Starter](#starter)

<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- tocstop -->

## Overview

> [!IMPORTANT]
> Make sure you have followed [the instructions to configure your development environment](../README.md#your-development-environment)
> before reading this section.

This repository is designed to be a quick-start for your Python Temporal application.
It is designed to be quick and easy to get started, rather than any example of
best practice.

This starter application consists of two parts:

* `src/worker.py`: this is where you define your workflow and contains the main business
  logic for your Temporal application.
* `src/starter.py`: this is how your trigger your workflow with any input variables
  and where you await the response.

## Quick start

Install dependencies using `uv`:

```sh
cd python
uv sync
source .venv/bin/activate
```

### Workflow

```shell
cd python
uv run poe dev
```

The workflow is a long-running application. For rapid development, the recommendation
is to use the file watcher.

You can also run this with `uv run src/worker.py` and restarting after every code
change.

### Starter

```shell
cd python
uv run src/starter.py
```

The starter will usually be something that runs to completion.
