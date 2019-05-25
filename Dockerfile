ARG DOCKER_VERSION=18.09.6

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

RUN pip install docker-compose==1.24.0rc3

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]