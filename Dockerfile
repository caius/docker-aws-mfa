FROM python:3.10-slim-bullseye

RUN pip install --upgrade pip

RUN pip install aws-mfa==0.0.12

ENTRYPOINT ["aws-mfa"]
