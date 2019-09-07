# create registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/speech2gesture:base

# Pull base image.
FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

LABEL maintainer Aaron "aaronwlj@foxmail.com"

# Install dependencies
# RUN apt-get -y update && \
#     apt-get install -y --no-install-recommends \
#     software-properties-common \
#     dirmngr \
#     apt-transport-https \
#     lsb-release \
#     ca-certificates \
#     openssh-server

# RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"    
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
        python2-dev \
        python-pip \
        git \
        g++ \
        make \
        wget \
        unzip \
        ffmpeg \
        vim \
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
        libv4l-dev
        
     
# pip 升级
# RUN python -m pip install --upgrade pip
        
# 安装基础库
RUN pip install -U setuptools \
    && pip --no-cache-dir install \
        numpy==1.16.4 \
        pandas==0.24.2 \
        scipy==1.2.2 \
        scikit-learn==0.20.3 \
        jupyterlab==1.0.2 \
        tqdm==4.32.2 \
        matplotlib==2.2.4 \
        imgaug \
        Keras==2.2.4 \
        librosa==0.7.0 \
        Pillow==6.1.0 \
        resampy==0.2.1 \
        tensorflow-gpu==1.9.0

# 安装服务常用包
# RUN pip --no-cache-dir install \
#     flask \
#     flask-restful \
#     flask_jsonrpc \
#     fire \
#     requests_toolbelt 

# 安装openpose deps
# RUN apt-get update && \
#     DEBIAN_FRONTEND=noninteractive \
#     apt-get install -y --no-install-recommends \
#         libprotobuf-dev \
#         protobuf-compiler \
#         libopencv-dev \
#         libgoogle-glog-dev \
#         libboost-all-dev \
#         libcaffe-cuda-dev \
#         libhdf5-dev \
#         libatlas-base-dev

# Install OpenCV
RUN pip --no-cache-dir install opencv-python==3.4.5.20

# 安装openpose
# ENV
# ENV PYTHON_EXECUTABLE="/usr/bin/python3.6"
# ENV PYTHON_LIBRARY="/usr/lib/x86_64-linux-gnu/libpython3.6m.so"

# # replace cmake as old version has CUDA variable bugs
# RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.2/cmake-3.14.2-Linux-x86_64.tar.gz && \
# tar xzf cmake-3.14.2-Linux-x86_64.tar.gz -C /opt && \
# rm cmake-3.14.2-Linux-x86_64.tar.gz
# ENV PATH="/opt/cmake-3.14.2-Linux-x86_64/bin:${PATH}"

# # get openpose
# WORKDIR /opt/openpose
# RUN git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git .

# # build it
# WORKDIR /opt/openpose/build
# RUN cmake -DBUILD_PYTHON=ON .. && make -j8 && make install
# WORKDIR /root

# 安装 DLIB
# RUN cd /root/ && \
#     git clone https://github.com/davisking/dlib.git && \
#     cd /root/dlib && \
#     python3 setup.py install && \
#     cd .. && \
#     rm -r /root/dlib

# 删除 apt lists
RUN rm -rf /var/lib/apt/lists/*

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
