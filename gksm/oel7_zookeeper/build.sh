if [ ! -z "$1" ]; then
	echo "docker build --tag=\"gksm/oel7_zookeeper:${1}\" --file=\"./Dockerfile\" ."
	docker build --tag="gksm/oel7_zookeeper:${1}" --file="./Dockerfile" .
	echo "docker tag -f  gksm/oel7_zookeeper:${1} gksm/oel7_zookeeper:latest"
	docker tag -f gksm/oel7_zookeeper:${1} gksm/oel7_zookeeper:latest
else
	echo "buil version should be set."
	echo "usage example $0 v2" 
fi
