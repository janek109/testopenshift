#FROM ubuntu:latest
FROM python:3.11-buster

#RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 871920D1991BC93C
#RUN apt-get update && apt-get install -y python python-pip

#RUN apt-get install -y python python-pip

#RUN pip install flask

ENV APP_ROOT=/opt/www
ENV PATH=/usr/local/bin:${PATH} HOME=${APP_ROOT}
RUN mkdir ${APP_ROOT} && \
    chmod -R u+x /usr/local/bin && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd

COPY app.py ${APP_ROOT}
COPY requirements.txt ${APP_ROOT}

RUN pip3 install -r ${APP_ROOT}/requirements.txt

USER 10001

WORKDIR ${APP_ROOT}

ENTRYPOINT FLASK_APP=${APP_ROOT}/app.py flask fun --host=0.0.0.0
