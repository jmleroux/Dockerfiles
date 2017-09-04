# Docker PHP CLI

[![Build Status](https://travis-ci.org/jmleroux/Dockerfiles.svg)](https://travis-ci.org/jmleroux/Dockerfiles)

## Supported tags and respective `Dockerfile` links

- `7.1`, `latest` [(Dockerfile)](https://github.com/jmleroux/Dockerfiles/blob/master/php/Dockerfile): Debian 9 + PHP 7.1
- `5.6` [(Dockerfile)](https://github.com/jmleroux/Dockerfiles/blob/master/php/5.6/Dockerfile): Debian 8 + PHP 5.6

## Run from Docker hub

Pull this image from [Docker hub](https://hub.docker.com/r/jmleroux/php/):

```bash
$ docker run -d --name jmleroux-php jmleroux/php
```

Access the URL `localhost:8080` with your web browser to check that the container works.

## Run from GitHub

Clone the repository and build the docker image:

```bash
$ docker build -t jmleroux-php .
```

Run a container:

```bash
$ docker run --name jmleroux-php -d php
```
