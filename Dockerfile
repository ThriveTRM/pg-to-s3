FROM alpine:3.6

RUN apk --no-cache add postgresql-client postgresql python py-pip bash
RUN pip install awscli

ADD bin/* /usr/local/bin/
CMD pg-to-s3
