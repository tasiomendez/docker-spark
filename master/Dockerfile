ARG HADOOP_VERSION=2.7.7
ARG SPARK_VERSION=2.4.4
FROM tasiomendez/spark-base:${SPARK_VERSION}-hadoop${HADOOP_VERSION}

ENV SPARK_PUBLIC_DNS localhost
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080

EXPOSE 6066 7077 8080

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
