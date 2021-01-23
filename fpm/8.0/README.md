## How to use this Docker file with Compose

```yaml
version: '3'

services:
    nginx:
        image: 'nginx:alpine'
        networks:
            - jmleroux

    fpm:
        image: 'jmleroux/fpm:8.0'
        environment:
            COMPOSER_HOME: '/var/www/.composer'
            PHP_IDE_CONFIG: 'serverName=jmleroux-web'
            XDEBUG_CONFIG: 'client_host=172.17.0.1'
            XDEBUG_MODE: '${XDEBUG_MODE:-off}'
            XDEBUG_SESSION: 'jmleroux-cli'
        volumes:
            - ./:/srv/app
            - ~/.composer:/var/www/.composer
        working_dir: /srv/app
        command: 'php-fpm8.0 -F'
        networks:
            - jmleroux

    mysql:
        image: mysql:8.0
        command: '--default-authentication-plugin=mysql_native_password'
        environment:
            MYSQL_ROOT_PASSWORD: 'root'
            MYSQL_USER: '${APP_DATABASE_USER}'
            MYSQL_PASSWORD: '${APP_DATABASE_PASSWORD}'
            MYSQL_DATABASE: '${APP_DATABASE_NAME}'
        networks:
            - jmleroux

networks:
    jmleroux:
```

**You will then be able to use the command line:**

To get php info:

```bash
docker-compose run -u www-data --rm fpm php -i
```

Execute a Symfony command:

```bash
docker-compose run -u www-data --rm fpm bin/console
```

etc.

To active Xdebug debugging in CLI:

```bash
XDEBUG_MODE=debug docker-compose run -u www-data --rm fpm php -i | grep Step
```

To start FPM with debugging:

```bash
XDEBUG_MODE=debug docker-compose up -d fpm
```
