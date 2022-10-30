FROM ubuntu:16.04

USER 12345

RUN apt-get update && apt-get install -y python python-pip

RUN pip install flask

COPY app.py /opt/

ENTRYPOINT FLASK_APP=/OPT/app.py flask fun --host=0.0.0.0
