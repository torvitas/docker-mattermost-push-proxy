FROM frolvlad/alpine-glibc:alpine-3.7
MAINTAINER jostyee <hi@syntaxoff.com>

# Use dl-5, as the cdn hosted on fastly.net, which has been blocked in China
RUN apk add --no-cache ca-certificates curl \
	&& curl -sSL https://github.com/mattermost/mattermost-push-proxy/releases/download/v4.4/mattermost-push-proxy-4.4.0.tar.gz | tar -xz \
	&& mv /mattermost-push-proxy/bin/mattermost-push-proxy /push-proxy \
	&& chmod +x /push-proxy \
	&& rm -rf /mattermost-push-proxy \
	&& apk del curl

EXPOSE 8066
ENTRYPOINT ["/push-proxy"]
