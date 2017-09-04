## Run from Docker hub

Pull this image from [Docker hub](https://hub.docker.com/r/jmleroux/apache-php/):

```bash
$ docker run -d --name jmleroux-fpm jmleroux/fpm
```

## Run from GitHub

Clone the repository and build the docker image:

```bash
$ docker build -t jmleroux-fpm .
```

Then you can run a container like this:

```bash
$ docker run --name jmleroux-fpm -d jmleroux-fpm
```
