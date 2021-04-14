# Pull base image.
FROM ubuntu:18.04

# Install all dependencies for OpenCV
RUN apt-get update && apt-get install -y rsync htop git openssh-server
RUN apt-get install python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install --upgrade pip
RUN pip install -U setuptools
RUN pip install openslide-python flask
    
RUN git clone https://github.com/openslide/openslide-python.git
WORKDIR /openslide-python
