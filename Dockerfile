FROM frolvlad/alpine-glibc:alpine-3.7
MAINTAINER Sascha Marcel Schmidt <mail@saschaschmidt.net>

WORKDIR /opt

RUN apk add --no-cache ca-certificates curl \
	&& curl -sSL https://github.com/mattermost/mattermost-push-proxy/releases/download/v4.4/mattermost-push-proxy-4.4.0.tar.gz | tar -xz \
	&& apk del curl

ENV PATH ${PATH}:/opt/mattermost-push-proxy/bin/

EXPOSE 8066
ENTRYPOINT ["push-proxy"]
