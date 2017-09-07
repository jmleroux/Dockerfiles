#!/usr/bin/env bash

didFail=1
images=("php" "fpm" "apache-php")
latestTag=$1

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ ));
do
    if [ "$TAG" == "$latestTag" ]; then
        path=${cwd}/${images[i]}
    else
        path=${cwd}/${images[i]}/${TAG}
    fi

    cd ${path}
    docker build -t jmleroux/${images[i]}:${TAG} .

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
