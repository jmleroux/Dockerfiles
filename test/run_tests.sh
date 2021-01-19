#!/usr/bin/env bash

didFail=1
images=("php" "fpm" "apache-php")
TAG=$1

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ ));
do
    path=${cwd}/${images[i]}/${TAG}

    cd ${path}
    docker build --no-cache -t jmleroux/${images[i]}:${TAG} .

    if docker inspect jmleroux/${images[i]}:${TAG} &> /dev/null; then
        didFail=0
        continue
    else
        echo "jmleroux/${images[i]}:${TAG} image does not exist!"
        didFail=1
        continue
    fi
done

exit ${didFail}
