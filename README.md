# Running Spark on Docker

This repo provides the necessary images for running a Spark Cluster using Spark's Standalone mode.
Spark provides different modes to run on clusters: local, client and cluster mode.

- Local mode. Spark is run locally on one machine.
- Client mode. The driver is launched in the same process as the client that submits the application.
- Cluster mode. The driver is launched from one of the worker processes inside the cluster, and the client process exits as soon as it fulfills its resposibility of submitting the application without waiting for the aplication to finish.

The folder `base` provides the base image for building the master and slaves of Spark.
The folder `hadoop` provides a single node cluster setup of Hadoop in order to provide the Hadoop Distributed File System (HDFS).
The folders `master` and `worker` provides the corresponding images of Spark.
Finally, the folder `submit` provides a template for submitting jobs to the Spark's Standalone Cluster.

## Getting started

For setting up the Spark's Standalone cluster it just needed to run the docker compose file.

```shell
docker-compose up
```

For scaling the number of workers in the cluster, it can be used the scale method of docker compose. However,
the user must take into account that the links on the WebUI will not work as expected due to the fact that internally
all the spark-workers use the same port for the WebUI even though docker compose maps them to different ports.

```shell
docker-compose up --scale spark-worker=<X>
```

In case, the user wants to build the images from scratch, the script `build.sh` could be executed as follows.

```shell
sh build.sh <folder of image to build>  # sh build.sh master/
```
