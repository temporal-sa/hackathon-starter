# Hackathon Starter

Run a [Temporal](https://temporal.io) hackathon

<!-- toc -->

<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- tocstop -->

## Getting started

> [!TIP]
> See the [development environment setup](#your-development-environment)

Thanks for joining in with this hackathon. It's designed to be enjoyable and
educational.

The first step is to [fork this repo](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo)
or [use it as a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).

### Running Temporal

You will need to have access to a Temporal instance. By default, this application
will be connected to a local instance of Temporal.

#### Local

> [!TIP]
> If you use a [supported development environment](#your-development-environment),
> you may already have a running instance of Temporal.
>
> You can stop this with `make temporal-stop`.

Run Temporal with `make temporal`. This will show the WebUI on [localhost:8233](http://localhost:8233)
and your application will connect to this on `localhost:7233`.

#### Cloud

If you wish to use [Temporal Cloud](https://cloud.temporal.io), you may do so
by [configuring these environment variables](https://docs.temporal.io/develop/environment-configuration#configuration-settings).

## Resources

> [!NOTE]
> [Temporal](https://temporal.io) is an open-source workflow orchestration platform
> that allows developers to build reliable, long-running applications as simple
> code. It ensures tasks run to completion by handling retries, failures, and
> state management automatically.

* [What is Temporal?](https://docs.temporal.io/temporal)
* [Introduction to Workflows](https://docs.temporal.io/workflows)
* [What is an Activity?](https://docs.temporal.io/activities)

## Supported languages

Temporal a code-first platform and [many languages are supported](https://docs.temporal.io/encyclopedia/temporal-sdks#official-sdks).
For this hackathon, see the individual languages:

* [Go](./golang)
* [TypeScript](./typescript)

## Your development environment

This is a hands-on hackathon, so you will need to write some code.
You're free to use any development environment you wish, but we have provided
some pre-configured environments so you can get started quicker. These are all
supported equally and you should choose the setup that you're most comfortable
with.

### Codespaces

> [!NOTE]
> [Codespaces](https://github.com/features/codespaces) is a remote development
> environment that allows one-click configuration of your development environment.

[Codespaces](https://github.com/features/codespaces) is a remote development
environment that allows one-click configuration of your development environment.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/__OWNER__/__REPO__)

### Dev Containers

> [!NOTE]
> [Dev Containers](https://containers.dev) allows you to use a container as a
> full-featured development environment.

1. Install [Docker](https://www.docker.com/get-started/)
1. Install [VSCode](https://code.visualstudio.com/) or [VSCode Insiders](https://code.visualstudio.com/insiders/)
1. Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
1. Either:
    * Clone this repo and open in VSCode, or
    * [Open in Dev Containers](http://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/__OWNER__/__REPO__)

### Docker Compose

> [!NOTE]
> Run the application inside [Docker Compose](https://docs.docker.com/compose).
> This is **NOT** a development environment, but does allow you to run the whole
> application stack on your local machine.
>
> This will run the Temporal UI on [localhost:8080](http://localhost:8080)

1. Enter the directory for the language you wish to develop in (eg, `cd golang`)
1. Install the dependencies. This is language-dependent, so please check the relevant
   README.
1. In one terminal window, run `docker compose up worker`
1. In another terminal window, run `docker compose up starter`

### Gitpod

> [!NOTE]
> [Gitpod](https://www.gitpod.io) is a remote development environment that allows
> one-click configuration of your development environment.

[Gitpod](https://www.gitpod.io) is a remote development environment that allows
one-click configuration of your development environment.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/__OWNER__/__REPO__)

### Local development

> [!CAUTION]
> You're strongly advised to use a pre-configured development environment as these
> are tested to make your development environment setup rapid, easy and reliable.
>
> If you do want to configure local development, the latest version of these
> dependencies should be used unless otherwise stated.

If you wish to configure Temporal manually, you will need to install the following
dependencies:

* [Temporal CLI](https://docs.temporal.io/cli)
* [Git](https://git-scm.com/downloads)

#### Optional dependencies

* [Docker](https://www.docker.com/get-started)
* [Docker Compose](https://docs.docker.com/compose/install)

#### Go

* [Go](https://go.dev)
* [Air](https://github.com/air-verse/air)

#### Python

* [Python](https://www.python.org/downloads)
* [uv](https://docs.astral.sh/uv)

#### TypeScript

* [NodeJS](https://nodejs.org/en/download)
* [nvm](https://github.com/nvm-sh/nvm)
