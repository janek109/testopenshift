FROM ubuntu:latest

RUN apt-get update && apt-get install -y python python-pip

RUN pip install flask

ENV APP_ROOT=/opt/www
ENV PATH=/usr/local/bin:${PATH} HOME=${APP_ROOT}
COPY bin/ /usr/local/bin/
RUN mkdir ${APP_ROOT} && \
    chmod -R u+x /usr/local/bin && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd

USER 10001

WORKDIR ${APP_ROOT}

COPY app.py ${APP_ROOT}

ENTRYPOINT FLASK_APP=/opt/${APP_ROOT}/app.py flask fun --host=0.0.0.0
