FROM ubuntu:14.04

MAINTAINER Igor Churmeev <ingvarch@gmail.com>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y build-essential python-dev libffi-dev libcairo2-dev python-pip

RUN pip install whisper carbon

COPY conf/ /opt/graphite/conf/

VOLUME /opt/graphite/storage/whisper

EXPOSE 2003 2004 7002


CMD /opt/graphite/bin/carbon-cache.py --config=/opt/graphite/conf/carbon.conf --pidfile=/var/run/carbin-cache.pid --logdir=/var/log/carbon/ --debug start
