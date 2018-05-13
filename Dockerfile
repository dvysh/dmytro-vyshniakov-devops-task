FROM python:2
MAINTAINER Dmytro Vyshniakov <dmytro.vyshniakov@gmail.com>

RUN pip install psutil && mkdir /proc-host
VOLUME ["/proc-host"]

ARG TIME=5
ARG MTR=all

ENV TIME $TIME
ENV MTR $MTR

COPY . .
ENTRYPOINT /run.sh $TIME $MTR
