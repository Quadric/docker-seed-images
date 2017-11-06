# FROM python:3.4.7
FROM python:3.6.3

LABEL net.quadric.vendor="Quadric ApS" maintainer="Ahmed Magdy <ahmed.magdy@quadric.net>"

# https://docs.python.org/3/using/cmdline.html#envvar-PYTHONUNBUFFERED
# ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      libatlas-base-dev gfortran && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt