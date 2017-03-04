This folder is for testing PHP containers.

You can start a container and then test the web access or the shell.

```bash
 docker run --name jml-php -v $(pwd):/var/www/html -p 8080:80 -d jml-php-latest
 ```

To enter bash and test/use the container:

```bash
docker exec -it jml-php /bin/bash
```
