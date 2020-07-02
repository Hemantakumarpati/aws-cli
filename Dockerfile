//FROM alpine:3.12
//MAINTAINER HemantaKumar pati
//RUN apk add --no-cache curl jq python3 py3-pip && \
  //sudo pip install --upgrade pip && \
  //sudo pip install awscli s3cmd https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz && \
  //sudo apk del py-pip && \
  //sudo mkdir /root/.aws

//COPY get-metadata /usr/local/bin/get-metadata */

FROM alpine:latest

# Define build time arguments
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

# Use UID 1000 if not passed as a build argument
ARG UID=1000

RUN set -ex \
    \
# Install dependencies
    && apk add --no-cache \
        python \
        groff \
        less \
        py-pip \
    \
# Install AWS CLI
    && pip --no-cache-dir install awscli==$VERSION \
    \
# Clean up
    && apk del py-pip \
    \
# Add aws user
    && adduser -D -u $UID aws

WORKDIR /home/aws

USER aws

CMD ["help"]
ENTRYPOINT ["aws"]
