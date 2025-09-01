# Hackathon Starter

Run a Temporal hackathon

<!-- toc -->

* [Getting started](#getting-started)
  * [Running Temporal](#running-temporal)
    * [Local](#local)
    * [Cloud](#cloud)
  * [Your development environment](#your-development-environment)
* [Resources](#resources)

<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- tocstop -->

## Getting started

Thanks for joining in with this hackathon. It's designed to be enjoyable and
educational.

### Running Temporal

You will need to have access to a Temporal instance. By default, this application
will be connected to a local instance of Temporal.

#### Local

> If you use a supported development environment, you may already have a running
> instance of Temporal.

Run Temporal with `make temporal`. This will show the WebUI on [localhost:8233](http://localhost:8233)
and your application will connect to this on `localhost:7233`.

#### Cloud

If you wish to use [Temporal Cloud](https://cloud.temporal.io), you may do so
by [configuring these environment variables](https://docs.temporal.io/develop/environment-configuration#configuration-settings).

### Your development environment

This is a hands-on hackathon, so you will need to write some code.

Various methods of developing in this project are provided, depending upon your
own preferences. These are all supported equally and you should choose the setup
that you're most comfortable with.

## Resources

* [What is Temporal?](https://docs.temporal.io/temporal)
* [Introduction to Workflows](https://docs.temporal.io/workflows)
* [What is an Activity?](https://docs.temporal.io/activities)
