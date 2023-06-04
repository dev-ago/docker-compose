ARG DOCKER_VERSION=23.0.5

FROM docker:${DOCKER_VERSION}

MAINTAINER Antony Goetzschel <mail@ago.dev>

RUN apk update

RUN apk upgrade

RUN apk add --no-cache \
		libseccomp \
		ca-certificates \
		python3-dev \
		py3-pip \
		libffi-dev \
		openssl-dev \
		gcc \
		libc-dev \
		make \
		bash \
		git \
		curl
RUN pip3 install --upgrade pip

RUN pip3 install ansible

RUN addgroup -S -g 1000 docker && adduser -S -G docker -u 1000 docker

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]

LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/dev-ago/docker-network-utils"
