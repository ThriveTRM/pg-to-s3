FROM postgres:9.6.3-alpine

RUN apk --no-cache add python py-pip bash && \
    pip install awscli && \
    apk del py-pip

ADD bin/* /usr/local/bin/
