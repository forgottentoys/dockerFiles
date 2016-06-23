IMAGE=oel7_marathon
if [ ! -z "$1" ]; then
	echo "docker build --tag=\"gksm/${IMAGE}:${1}\" --file=\"./Dockerfile\" ."
	docker build --tag="gksm/${IMAGE}:${1}" --file="./Dockerfile" .
	echo "docker tag -f  gksm/${IMAGE}:${1} gksm/${IMAGE}:latest"
	docker tag -f gksm/${IMAGE}:${1} gksm/${IMAGE}:latest
else
	echo "buil version should be set."
	echo "usage example $0 v2" 
fi
