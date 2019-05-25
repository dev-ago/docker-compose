ARG DOCKER_VERSION=18.09.6
ARG COMPOSE_VERSION=1.23.2
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

RUN pip install docker-compose==${COMPOSE_VERSION}

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]