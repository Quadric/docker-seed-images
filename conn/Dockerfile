FROM python:3.4

LABEL maintainer="Ahmed Magdy <ahmed.magdy@quadric.net>"

# TODO use mongo-connector/requirements file to install dependencies !
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

# RUN pip install elastic2-doc-manager[elastic2]==0.3.0 elasticsearch==2.4.0 mongo-connector==2.5
