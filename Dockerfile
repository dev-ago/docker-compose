FROM docker:18.09.6

RUN apk add --no-cache py-pip python-dev libffi-dev openssl-dev
RUN apk add --no-cache gcc libc-dev make bash git
RUN pip install docker-compose==1.23.2