## Run from Docker hub

```bash
$ docker run --name jmleroux-apache-php -p 8080:80 -d jmleroux/apache-php
```

## Run from GitHub

Clone the repository and build the docker image:

```bash
$ docker build -t jmleroux-apache-php .
```

Then run a container:

```bash
$ docker run --name jmleroux-apache-php -p 8080:80 -d jmleroux-apache-php
```
