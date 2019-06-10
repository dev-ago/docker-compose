ARG DOCKER_VERSION=18.09.6
ARG COMPOSE_VERSION=1.24.0rc3

FROM docker:${DOCKER_VERSION}

MAINTAINER Antony Goetzschel <mail@ago.dev>

RUN apk add --no-cache \
		ca-certificates \
		py-pip python-dev \
		libffi-dev \
		openssl-dev \
		gcc \
		libc-dev \
		make \
		bash \
		git \
		curl

RUN pip install "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}"

RUN addgroup -S -g 1000 docker && adduser -S -G docker -u 1000 docker

RUN docker --version && \
    docker-compose --version && \
    git --version

COPY docker-entrypoint.sh /usr/local/bin/


ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]

LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/dev-ago/docker-network-utils"