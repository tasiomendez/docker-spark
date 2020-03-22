ARG HADOOP_VERSION=2.7.7
ARG SPARK_VERSION=2.4.4
FROM tasiomendez/spark-base:${SPARK_VERSION}-hadoop${HADOOP_VERSION}

COPY spark-defaults.conf .
RUN mv spark-defaults.conf $SPARK_HOME/conf/

ENV SPARK_MASTER_HOST localhost
ENV SPARK_MASTER_PORT 7077
ENV SPARK_DEPLOY_MODE client

ENV HADOOP_HOST hadoop
ENV HADOOP_PORT 9000

ENV JAVA_JAR_MAIN_CLASS my.main.Application

# MAVEN
RUN apt-get update \
     && apt-get install -y maven \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/* \
     && mkdir -p /usr/src/app

# Copy the POM-file first, for separate dependency resolving and downloading
# ONBUILD COPY pom.xml /usr/src/app
# ONBUILD RUN cd /usr/src/app \
#      && mvn dependency:resolve
# ONBUILD RUN cd /usr/src/app \
#      && mvn verify

# Copy the source code and build the application
ONBUILD COPY . /usr/src/app
ONBUILD RUN cd /usr/src/app \
     && mvn clean package

ONBUILD WORKDIR /usr/src/app

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["target/application.jar"]
