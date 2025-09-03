FROM python:3.12 AS builder
RUN useradd -m -u 1000 python
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
USER python
WORKDIR /home/python/app
COPY --chown=python:python . .
CMD [ "uv", "run", "poe", "dev" ]
