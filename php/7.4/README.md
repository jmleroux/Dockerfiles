# Toggle Xdebug activation via docker-compose

With Xdebug3, you can enable/disable Xdebug via environment variables in your docker-compose file. 

[Step Debugging Xdebug documentation](https://xdebug.org/docs/step_debug#mode)

```yml
services: 3.2
    php:
# ... 
    environment:
        PHP_IDE_CONFIG: 'serverName=your_app'
        XDEBUG_CONFIG: >-
            client_port=9003
            client_host=172.17.0.1
            discover_client_host=1
            idekey=PHPSTORM
        XDEBUG_MODE: '${XDEBUG_MODE:-off}'
        XDEBUG_SESSION: 1
```
Available xdebug modes : 
* off
* develop
* coverage
* debug
* gcstats
* profile
* trace

```bash
$ XDEBUG_MODE=debug docker-compose up -d php
```
