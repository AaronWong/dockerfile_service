FROM nvidia/cuda:11.0-runtime-ubuntu20.04

# Install all dependencies for openslide
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends rsync htop git openssh-server
RUN apt-get install python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install --upgrade pip
RUN pip install -U setuptools
RUN pip install openslide-python flask
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends  libopenslide-dev -y

# bxr
RUN pip3 install fastapi \
    uvicorn \
    redis \
    minio \
    opencv-python==3.4.5.20 \
    tensorflow-gpu==2.4.1
    
# 删除 apt lists
RUN rm -rf /var/lib/apt/lists/*
