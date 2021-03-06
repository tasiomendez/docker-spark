FROM debian:stretch

RUN apt-get update \
     && apt-get install -y curl python3 python3-setuptools wget \
     && ln -s /usr/bin/python3 /usr/bin/python \
     && easy_install3 pip py4j \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# JAVA
RUN apt-get update \
     && apt-get install -y default-jdk \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/default-java

# HADOOP
ARG HADOOP_VERSION=2.7.7
ENV HADOOP_VERSION $HADOOP_VERSION
ENV HADOOP_HOME /usr/hadoop-${HADOOP_VERSION}
ENV HADOOP_PACKAGE hadoop-${HADOOP_VERSION}

RUN echo Downloading ${HADOOP_PACKAGE}.tar.gz
RUN wget --quiet https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/${HADOOP_PACKAGE}.tar.gz \
     && tar -xzf ${HADOOP_PACKAGE}.tar.gz \
     && mv ${HADOOP_PACKAGE} ${HADOOP_HOME} \
     && rm ${HADOOP_PACKAGE}.tar.gz \
     && chown -R root:root $HADOOP_HOME

# SPARK
ARG SPARK_VERSION=2.4.4
ENV SPARK_VERSION $SPARK_VERSION
ENV SPARK_PACKAGE spark-${SPARK_VERSION}-bin-without-hadoop
ENV SPARK_HOME /usr/spark-${SPARK_VERSION}
ENV PATH $PATH:${SPARK_HOME}/bin
ENV SPARK_DIST_CLASSPATH $HADOOP_HOME/etc/hadoop:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/hdfs:$HADOOP_HOME/share/hadoop/hdfs/lib/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/yarn/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/contrib/capacity-scheduler/*.jar
ENV LD_LIBRARY_PATH $HADOOP_HOME/lib/native:$LD_LIBRARY_PATH

RUN echo Downloading ${SPARK_PACKAGE}.tgz
RUN wget --quiet https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_PACKAGE}.tgz \
     && tar -xzf ${SPARK_PACKAGE}.tgz \
     && mv ${SPARK_PACKAGE} ${SPARK_HOME} \
     && rm ${SPARK_PACKAGE}.tgz \
     && chown -R root:root $SPARK_HOME
