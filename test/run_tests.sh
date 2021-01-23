#!/usr/bin/env bash

didFail=0
images=("php" "fpm" "apache-php")
TAG=$1

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ ));
do
    path=${cwd}/${images[i]}/${TAG}

    if [ ! -d "$path" ]; then
        echo "No Dockerfile for jmleroux/${images[i]}:${TAG}"
        continue
    fi

    cd ${path}
    docker build --no-cache -t jmleroux/${images[i]}:${TAG} .
    docker run  -e XDEBUG_MODE=debug jmleroux/${images[i]}:${TAG} php -i | grep Debugger

    if docker inspect jmleroux/${images[i]}:${TAG} &> /dev/null; then
        continue
    else
        echo "jmleroux/${images[i]}:${TAG} image does not exist!"
        didFail=1
        continue
    fi
done

exit ${didFail}
