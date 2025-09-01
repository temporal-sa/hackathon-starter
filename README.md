# Hackathon Starter

Run a Temporal hackathon

<!-- toc -->

* [Getting started](#getting-started)
  * [Running Temporal](#running-temporal)
    * [Local](#local)
    * [Cloud](#cloud)
* [Resources](#resources)
* [Your development environment](#your-development-environment)
  * [Dev Containers](#dev-containers)
    * [VSCode](#vscode)
    * [Codespaces](#codespaces)
  * [Gitpod](#gitpod)

<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- tocstop -->

## Getting started

Thanks for joining in with this hackathon. It's designed to be enjoyable and
educational.

### Running Temporal

You will need to have access to a Temporal instance. By default, this application
will be connected to a local instance of Temporal.

#### Local

> If you use a [supported development environment](#your-development-environment),
> you may already have a running instance of Temporal.

Run Temporal with `make temporal`. This will show the WebUI on [localhost:8233](http://localhost:8233)
and your application will connect to this on `localhost:7233`.

#### Cloud

If you wish to use [Temporal Cloud](https://cloud.temporal.io), you may do so
by [configuring these environment variables](https://docs.temporal.io/develop/environment-configuration#configuration-settings).

## Resources

* [What is Temporal?](https://docs.temporal.io/temporal)
* [Introduction to Workflows](https://docs.temporal.io/workflows)
* [What is an Activity?](https://docs.temporal.io/activities)

## Your development environment

This is a hands-on hackathon, so you will need to write some code.

You're free to use any development environment you wish, but we have provided
some pre-configured environments so you can started quicker. These are all supported
equally and you should choose the setup that you're most comfortable with.

### Dev Containers

A development container allows you to use a container as a fully-featured development
environment.

#### VSCode

1. Install [Docker](https://www.docker.com/get-started/)
1. Install [VSCode](https://code.visualstudio.com/) or [VSCode Insiders](https://code.visualstudio.com/insiders/)
1. Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
1. Either:
    * Clone this repo and open in VSCode, or
    * [Open in Dev Containers](http://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/temporal-sa/hackathon-starter)

#### Codespaces

To follow

### Gitpod

[Gitpod](https://www.gitpod.io) is a remote development environment that allows
one-click configuration of your development environment.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/temporal-sa/hackathon-starter)
