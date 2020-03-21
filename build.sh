#! /bin/sh

if [ -z "${TAG}" ]; then
  TAG=2.4.4-hadoop2.7.7
fi

IMAGE=tasiomendez/spark-${1%/}:${TAG%/}

cd $1
echo '>>' building $IMAGE in $(pwd)
docker build -t $IMAGE .
cd -
