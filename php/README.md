# Docker PHP CLI

## Run from Docker hub

```bash
$ docker run -d --name jmleroux-php jmleroux/php
```

## Run from GitHub

Clone the repository and build the docker image:

```bash
$ docker build -t jmleroux-php .
```

Run a container:

```bash
$ docker run --name jmleroux-php -d php
```
