# create registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/a2b:base

# Pull base image.
FROM nvidia/cuda:9.2-cudnn7-devel

LABEL maintainer Aaron "aaronwlj@foxmail.com"

# Install dependencies
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    software-properties-common \
    dirmngr \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    openssh-server
    
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        python3-dev \
        python3-pip \
        git \
        g++ \
        make \
        wget \
        unzip \
        build-essential \
        pkg-config \
        libatlas-base-dev \
        gfortran \
        libgtk2.0-dev \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libv4l-dev \
        ffmpeg \
        vim
        
# pip 升级
# RUN python3 -m pip install --upgrade pip
        
# 安装服务常用包
RUN pip3 install -U setuptools \
    && pip3 --no-cache-dir install \
            flask \
            flask-restful \
            flask_jsonrpc \
            fire \
            requests_toolbelt 

# Audio2BodyDynamics requirements
RUN pip3 --no-cache-dir install \
  certifi==2018.8.24 \
  cycler==0.10.0 \
  kiwisolver==1.0.1 \
  matplotlib==3.0.0 \
  numpy==1.15.2 \
  Pillow==5.3.0 \
  pyparsing==2.2.2 \
  python-dateutil==2.7.3 \
  scikit-learn==0.20.0 \
  scipy==1.1.0 \
  six==1.11.0 \
  sklearn==0.0 \
  torch==0.4.1 \
  torchvision==0.2.1 \
  opencv-python==3.4.3.18

# 安装基础库
RUN pip3 --no-cache-dir install \
  pandas \
  jupyterlab \
  tqdm \
  imgaug

# replace cmake as old version has CUDA variable bugs
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.2/cmake-3.14.2-Linux-x86_64.tar.gz && \
tar xzf cmake-3.14.2-Linux-x86_64.tar.gz -C /opt && \
rm cmake-3.14.2-Linux-x86_64.tar.gz
ENV PATH="/opt/cmake-3.14.2-Linux-x86_64/bin:${PATH}"

# 安装 DLIB
RUN cd /root/ && \
    git clone https://github.com/davisking/dlib.git && \
    cd /root/dlib && \
    python3 setup.py install && \
    cd .. && \
    rm -r /root/dlib

# 删除 apt lists
RUN rm -rf /var/lib/apt/lists/*

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
