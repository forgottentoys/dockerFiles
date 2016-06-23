IMAGE="gksm/oel7_basesoft"

if [ ! -z "$1" ]; then
	echo "docker build --tag=\"${IMAGE}:${1}\" --file=\"./Dockerfile\" ."
	docker build --tag="${IMAGE}:${1}" --file="./Dockerfile" .
	echo "docker tag -f  ${IMAGE}:${1} ${IMAGE}:latest"
	docker tag -f ${IMAGE}:${1} ${IMAGE}:latest
else
	echo "buil version should be set."
	echo "usage example $0 v2" 
fi
