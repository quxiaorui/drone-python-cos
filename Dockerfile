FROM python:3.9-alpine
LABEL maintainer='qxr <quxiaorui@qq.com>'
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && apk update && apk --no-cache add \
        gcc g++ \
    && pip install coscmd -i https://mirrors.aliyun.com/pypi/simple \
    && apk del gcc g++ \
    && rm -rf /var/cache/apk/* \
    && rm -rf /root/.cache \
    && rm -rf /tmp/*
WORKDIR /root
CMD python3