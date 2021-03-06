Dockerfiles
oel7_zookeeper
-------------------------------------------------------------------------------------------------------------------------------
docker run -d \
--name zookeeper_1 \
--net=host \
-p 2181:2181 \
-p 2888:2888 \
-p 3888:3888 \
-v /media/data/zookeeper/data:/media/data/zookeeper/data \
-v /media/data/zookeeper/logs:/media/data/zookeeper/logs \
-v /media/data/zookeeper/redo:/media/data/zookeeper/redo \
--restart=always \
gksm/oel7_zookeeper:latest /opt/zookeeper/latest/bin/startup.sh -myid 1 -zk server.1=hostname1:2888:3888 -zk server.2=hostname2:2888:3888 -zk server.3=hostname3:2888:3888



oel7_mesos
-------------------------------------------------------------------------------------------------------------------------------
docker run -d \
--name=mesos_master_1 \
--privileged \
--net=host \
--restart always \
-p "5050:5050" \
-e "MESOS_IP=127.0.0.1" \
-e "MESOS_HOSTNAME=hostname" \
-e "MESOS_ZK=zk://hostname:2181/mesos" \
-e "MESOS_PORT=5050" \
-e "MESOS_LOG_DIR=/var/log/mesos" \
-e "MESOS_CLUSTER=MyCluster" \
-e "MESOS_QUORUM=1" \
-e "MESOS_REGISTRY=in_memory" \
-e "MESOS_WORK_DIR=/var/lib/mesos" \
-v "/media/data/mesos/master/log:/var/log/mesos" \
-v "/media/data/mesos/master/work:/var/lib/mesos" \
gksm/oel7_mesos


oel7_marathon
-------------------------------------------------------------------------------------------------------------------------------
docker run -d \
-e "MARATHON_HOSTNAME=hostname" \
-e "MARATHON_MASTER=zk://hostname:2181/mesos" \
-e "MARATHON_ZK=zk://hostname:2181/marathon" \
--name marathon \
--net host \
--restart always \
gksm/oel7_marathon

mesosphere/mesos-dns
-------------------------------------------------------------------------------------------------------------------------------
docker run -d \
--net=host \
-v "/media/data/mesos-dns/config.json:/config.json" \
-v "/media/data/mesos-dns/logs:/tmp" \
mesosphere/mesos-dns:0.5.2 /usr/bin/mesos-dns -v=2 -config=/config.json
