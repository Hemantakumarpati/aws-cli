FROM alpine:3.12
MAINTAINER HemantaKumar pati
RUN apk add --no-cache curl jq python3 py3-pip && \
  pip install --upgrade pip && \
  pip install awscli s3cmd https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz && \
  apk del py-pip && \
  mkdir /root/.aws

COPY get-metadata /usr/local/bin/get-metadata
