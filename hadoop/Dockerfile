ARG HADOOP_VERSION=2.7.7
ARG SPARK_VERSION=2.4.4
FROM tasiomendez/spark-base:${SPARK_VERSION}-hadoop${HADOOP_VERSION}

RUN apt-get update \
     && apt-get install -y wget ssh rsync \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

# SSH
RUN ssh-keygen -t rsa -P "" -f $HOME/.ssh/id_rsa \
     && cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

# HADOOP Configuration
COPY conf/*.xml ./
RUN mv ./*.xml $HADOOP_HOME/etc/hadoop/

EXPOSE 9000 8020 50070 8032 8088

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
