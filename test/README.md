## Test PHP containers

Build the container:
```bash
docker build  -t jml-php-latest ../latest/
```

Start a container and then test the web access or the shell:
```bash
 docker run --name jml-php -v $(pwd):/var/www/html -p 8080:80 -d jml-php-latest
 ```

Enter bash and test/use the container:
```bash
docker exec -it jml-php /bin/bash
```

## Networking

You can add the host ip to the container's `/etc/hosts` to access its services, like a local MySQL:

```bash
docker run --name jml-php \
    -p 8080:80 \
    --add-host host:$(ip route show | grep docker0.*src | awk '{print $9}') \
    -v $(pwd):/var/www/html -d jml-php-5.6
```
