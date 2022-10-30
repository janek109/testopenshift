FROM ubuntu:16.04

USER 579c1075-5839-11ed-9fbe-525400541fb2

RUN apt-get update && apt-get install -y python python-pip

RUN pip install flask

COPY app.py /opt/

ENTRYPOINT FLASK_APP=/OPT/app.py flask fun --host=0.0.0.0
