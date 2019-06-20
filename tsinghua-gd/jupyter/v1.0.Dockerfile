# create registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/jupyter:v1.0

# Pull base image.
FROM nvidia/cuda:10.0-cudnn7-devel

LABEL maintainer Aaron "aaronwlj@foxmail.com"

# pip 升级
RUN python3 -m pip install --upgrade pip

# 安装基础库
RUN python3 -m pip install -U setuptools \
    && python3 -m pip --no-cache-dir install \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        jupyterlab 
  
# 安装服务常用包
RUN python3 -m pip --no-cache-dir install \
    flask \
    flask-restful \
    flask_jsonrpc \
    fire \
    requests_toolbelt 

# Install all dependencies for OpenCV
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        python3-dev \
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
        libprotobuf-dev \
        libjasper-dev \
        libv4l-dev \
        protobuf-compiler \
        libopencv-dev \
        libgoogle-glog-dev \
        libboost-all-dev \
        libcaffe-cuda-dev \
        libhdf5-dev \
        libatlas-base-dev

# Install tensorflow-gpu
RUN python3 -m pip --no-cache-dir install tensorflow-gpu==1.12

# Install OpenCV
RUN python3 -m pip --no-cache-dir install opencv-python==3.4.5.20

# Install pytorch-1.0.1
RUN python3 -m pip --no-cache-dir install \
      torch \
      torchvision \
      tensorboardX

# 安装openpose
# ENV
ENV PYTHON_EXECUTABLE="/usr/bin/python3.5"
ENV PYTHON_LIBRARY="/usr/lib/x86_64-linux-gnu/libpython3.5m.so"

# replace cmake as old version has CUDA variable bugs
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.2/cmake-3.14.2-Linux-x86_64.tar.gz && \
tar xzf cmake-3.14.2-Linux-x86_64.tar.gz -C /opt && \
rm cmake-3.14.2-Linux-x86_64.tar.gz
ENV PATH="/opt/cmake-3.14.2-Linux-x86_64/bin:${PATH}"

# get openpose
WORKDIR /opt/openpose
RUN git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git .

# build it
WORKDIR /opt/openpose/build
RUN cmake -DBUILD_PYTHON=ON .. && make -j8 && make install
WORKDIR /root

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
