#!/bin/bash
ZOO_TMP_CFG="/opt/zookeeper/latest/conf/zoo_template.cfg"
ZOO_CFG="/opt/zookeeper/latest/conf/zoo.cfg"
ZOO_DATA="/media/data/zookeeper/data"

usage() {
echo "Usage:"
echo "$0 -myid 1 -zk server.1=zookeeper1.domain.ru:2888:3888 -zk secureClientPort=2281"
}

parsing_input() {
while [[ -n "$1" ]]; do
        case $1 in
                -zk )
			shift
			if [ -n "$1" ]; then
				echo "${1}" >> $ZOO_TMP_CFG;
			else
	                        usage;
	                        exit 1
			fi
                ;;
                -myid )
			shift
			if  [ -n "$1" ]; then
				echo $1 > $ZOO_DATA/myid
			else
	                        usage;
		                exit 1
                        fi
                ;;
                * )
                        usage;
                        exit 1
        esac
	shift
done
cp $ZOO_TMP_CFG $ZOO_CFG
}

if [[ -z "$4" ]]; then
        usage;
        exit 1
fi

parsing_input $@

ZOO_LOG_DIR=/media/data/zookeeper/logs ZOO_LOG4J_PROP='INFO,ROLLINGFILE' ZOOBINDIR=/opt/zookeeper/latest/bin /opt/zookeeper/latest/bin/zkServer.sh start-foreground
