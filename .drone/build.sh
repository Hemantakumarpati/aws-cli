#!/bin/bash
set -e  
cd /var/cache/drone/src/github.com/Hemantakumarpati/aws-cli
# [pass tests here]

wrapdocker &
sleep 5

docker build -t hemantakumarpati/awscli:latest . 
docker login -u "hemantakumarpati" -p "Master@1927" docker.io
#docker tag tomcatonline hemantakumarpati/tomcatonetime:latest
docker push hemantakumarpati/awscli:latest .
docker container run -it -d --name awscli -p 5000:5000 hemantakumarpati/awscli
