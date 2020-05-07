# Pull base image.
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

LABEL maintainer Aaron "aaronwlj@foxmail.com"

# Install dependencies
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        git \
        g++ \
        make \
        wget \
        unzip \
        vim \
        build-essential \
        libssl-dev \
        libffi-dev \
        libxml2 \
        libxml2-dev \
        libxslt1-dev \
        libsndfile1 \
        libasound-dev \
        portaudio19-dev \
        libportaudio2 \
        libportaudiocpp0
        
WORKDIR /tmp/
RUN wget https://www.python.org/ftp/python/3.7.1/Python-3.7.4.tgz && \
         tar -zxvf Python-3.7.4.tgz
WORKDIR /tmp/Python-3.7.4
RUN ./configure && make && make install && \
    rm /usr/bin/python3 && \
    ln -s /usr/bin/python3.7 /usr/bin/python3
