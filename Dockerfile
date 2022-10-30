FROM ubuntu:16.04

RUN groupadd -r swuser -g 433 && \
    useradd -u 431 -r -g swuser -s /sbin/nologin -c "Docker image user" swuser

RUN cat /etc/passwd

USER root

RUN apt-get update && apt-get install -y python python-pip

RUN pip install flask

USER swuser

COPY app.py /opt/

ENTRYPOINT FLASK_APP=/OPT/app.py flask fun --host=0.0.0.0
