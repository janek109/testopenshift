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

WORKDIR ${APP_ROOT}

COPY app.py .
COPY requirements.txt .

RUN python3.11 -m pip install -r requirements.txt

COPY . .

USER 10001

ENTRYPOINT FLASK_APP=${APP_ROOT}/app.py flask fun --host=0.0.0.0
