ARG DOCKER_VERSION=
ARG COMPOSE_VERSION=
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