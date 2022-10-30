#FROM ubuntu:latest
FROM python:3.8-slim-buster

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

RUN apt install python3-pip

USER 10001

WORKDIR ${APP_ROOT}

COPY app.py ${APP_ROOT}
COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
