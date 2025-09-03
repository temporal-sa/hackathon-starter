# TypeScript Starter

Build your Temporal application in TypeScript ([docs](https://docs.temporal.io/develop/typescript))

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

This repository is designed to be a quick-start for your TypeScript Temporal application.
It is designed to be quick and easy to get started, rather than any example of
best practice.

This starter application consists of two parts:

* `worker.ts`: this is where you define your workflow and contains the main business
  logic for your Temporal application.
* `starter.ts`: this is how your trigger your workflow with any input variables and
  where you await the response.

## Quick start

Install dependencies using `npm`:

```sh
cd typescript
npm ci
```

### Workflow

```shell
cd typescript
npm run worker:watch
```

The workflow is a long-running application. For rapid development, the recommendation
is to use the file watcher.

You can also run this with `npm run worker` and restarting after every code change.

### Starter

```shell
cd typescript
npm run starter
```

The starter will usually be something that runs to completion.
