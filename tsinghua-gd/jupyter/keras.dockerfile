# create registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/jupyter:keras

# Pull base image.
FROM nvidia/cuda:10.0-cudnn7-devel

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
        libprotobuf-dev \
        libjasper-dev \
        libv4l-dev \
        protobuf-compiler \
        libopencv-dev \
        libgoogle-glog-dev \
        libboost-all-dev \
        libcaffe-cuda-dev \
        libhdf5-dev \
        libatlas-base-dev \
        ffmpeg \
        vim
     
# pip 升级
# RUN python3 -m pip install --upgrade pip

# 安装基础库
RUN pip3 install -U setuptools \
    && pip3 --no-cache-dir install \
        numpy==1.18.1 \
        pandas \
        scipy \
        scikit-learn==0.22.1 \
        jupyterlab \
        tqdm \
        matplotlib \
        tensorflow-gpu==1.15.0 \
        keras==2.2.4
        
# 安装服务常用包
RUN pip3 --no-cache-dir install \
    flask \
    flask-restful \
    flask_jsonrpc \
    fire \
    requests_toolbelt 

# Install OpenCV
RUN pip3 --no-cache-dir install opencv-python==3.4.5.20

# 删除 apt lists
RUN rm -rf /var/lib/apt/lists/*

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
