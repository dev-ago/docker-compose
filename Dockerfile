ARG DOCKER_VERSION=18.09.6
ARG COMPOSE_VERSION=1.24.0rc3

MAINTAINER Antony Goetzschel <mail@ago.dev>
FROM docker:${DOCKER_VERSION}

RUN apk add --no-cache \
		ca-certificates \
		py-pip python-dev \
		libffi-dev \
		openssl-dev \
		gcc \
		libc-dev \
		make \
		bash \
		git

RUN pip install "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}"

RUN addgroup -S -g 1000 docker && adduser -S -G docker -u 1000 docker

RUN docker --version && \
    docker-compose --version && \
    git --version

COPY docker-entrypoint.sh /usr/local/bin/


ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]