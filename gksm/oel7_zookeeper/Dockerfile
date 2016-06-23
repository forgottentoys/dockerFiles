#
# software Dockerfile
# 
# Installing ZooKeeper for oraclelinux:7
#

# Pull base image.
FROM gksm/oel7_jdk1.8:latest 

MAINTAINER Evgenii.Poliakov@gmail.com


RUN mkdir -p /opt/zookeeper && \
mkdir -p /media/data/zookeeper/data && \
mkdir /media/data/zookeeper/redo && \
mkdir /media/data/zookeeper/logs

ADD zookeeper-*.tar.gz /opt/zookeeper/
RUN ln -s /opt/zookeeper/zookeeper* /opt/zookeeper/latest
COPY java.env /opt/zookeeper/latest/conf
COPY zoo_template.cfg /opt/zookeeper/latest/conf
COPY log4j.properties /opt/zookeeper/latest/conf
COPY startup.sh /opt/zookeeper/latest/bin
RUN chmod +x /opt/zookeeper/latest/bin/startup.sh


EXPOSE 2181 2888 3888
WORKDIR /opt/zookeeper/latest/bin
CMD /opt/zookeeper/latest/bin/startup.sh 
