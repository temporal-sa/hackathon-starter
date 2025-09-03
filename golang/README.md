# Golang Starter

Build your Temporal application in Go ([docs](https://docs.temporal.io/develop/go))

<!-- toc -->

* [Overview](#overview)
* [Quick start](#quick-start)
  * [Workflow](#workflow)
  * [Starter](#starter)
* [Design considerations](#design-considerations)
  * [Activity dependency injection](#activity-dependency-injection)

<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- tocstop -->

## Overview

> [!IMPORTANT]
> Make sure you have followed [the instructions to configure your development environment](../README.md#your-development-environment)
> before reading this section.

This repository is designed to be a quick-start for your Go Temporal application.
It is designed to be quick and easy to get started, rather than any example of
best practice.

This starter application consists of two parts:

* `worker`: this is where you define your workflow and contains the main business
  logic for your Temporal application.
* `starter`: this is how your trigger your workflow with any input variables and
  where you await the response.

## Quick start

Install [`Air`](https://github.com/air-verse/air#installation) to allow live
reloading your long-running applications. This is installed automatically
if you use have followed [the instructions to configure your development environment](../README.md#your-development-environment).

### Workflow

```shell
cd golang
air
```

The workflow is a long-running application. For rapid development, the recommendation
is to use [Air](https://github.com/air-verse/air).

You can also run this with `go run ./worker` and restarting after every code change.

### Starter

```shell
cd golang
go run ./starter
```

The starter will usually be something that runs to completion.

## Design considerations

### Activity dependency injection

The activities are functions on a `struct`. This is done so that external dependencies
(eg, a database connection) can be injected in. This allows for the connection
to be verified at run-time and used when a call is made. This avoids having to
create the dependency when an activity is received, which may fail.
