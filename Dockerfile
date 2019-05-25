FROM alpine:3.9

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

RUN pip install docker-compose==1.23.2

CMD ["/bin/sh"]