FROM python:3.10-slim-bullseye

LABEL org.opencontainers.image.authors="Caius Durling"
LABEL org.opencontainers.image.url=https://github.com/caius/docker-aws-mfa
LABEL org.opencontainers.image.source=https://github.com/caius/docker-aws-mfa
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.title=aws-mfa
LABEL org.opencontainers.image.description="An easy way to run aws-mfa to (re)generate your MFA credentials in an AWS profile"
LABEL org.opencontainers.image.base.name=docker.io/library/python:3.10-slim-bullseye

RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install --requirement requirements.txt

ENTRYPOINT ["aws-mfa"]
