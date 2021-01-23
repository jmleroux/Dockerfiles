## How to use this Docker file with Compose

```yaml
version: '3'

services:
    nginx:
        image: 'nginx:alpine'
        networks:
            - jmleroux

    fpm:
        build: .
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
