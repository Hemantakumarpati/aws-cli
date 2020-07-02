FROM alpine:3.12
MAINTAINER HemantaKumar pati
RUN apk add --no-cache curl jq python3 py3-pip && \
  sudo pip install --upgrade pip && \
  sudo pip install awscli s3cmd https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz && \
  sudo apk del py-pip && \
  sudo mkdir /root/.aws

COPY get-metadata /usr/local/bin/get-metadata
