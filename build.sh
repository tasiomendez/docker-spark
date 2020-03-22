#! /bin/sh

SPARK_VERSION=$2
HADOOP_VERSION=$3

if [ -z "${SPARK_VERSION}" ]; then
  SPARK_VERSION=2.4.4
fi

if [ -z "${HADOOP_VERSION}" ]; then
  HADOOP_VERSION=2.7.7
fi

TAG=${SPARK_VERSION}-hadoop${HADOOP_VERSION}
IMAGE=tasiomendez/spark-${1%/}:${TAG}

cd $1
echo '>>' building $IMAGE in $(pwd)
docker build -t $IMAGE \
    --build-arg SPARK_VERSION=${SPARK_VERSION} \
    --build-arg HADOOP_VERSION=${HADOOP_VERSION} .
cd -
