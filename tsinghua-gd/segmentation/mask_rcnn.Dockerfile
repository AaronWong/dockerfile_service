# create registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/segmentation:mask_rcnn

# Pull base image.
FROM tensorflow/tensorflow:1.12.0-gpu-py3

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
        keras \
        tqdm \
        scikit-image \
        imgaug
    
# 安装服务常用包
RUN python3 -m pip --no-cache-dir install \
    flask \
    flask-restful \
    flask_jsonrpc \
    fire \
    requests_toolbelt 

# Install all dependencies for OpenCV
RUN apt-get -y update && \
    apt-get -y install \
        git \
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
        libv4l-dev 

# Install OpenCV==3.4.5
RUN python3 -m pip --no-cache-dir install opencv-python==3.4.5.20
    
# 删除 apt lists
RUN rm -rf /var/lib/apt/lists/*

# 删除 tensorflow 安装包
RUN rm /tensorflow_gpu-1.12.0-cp35-cp35m-manylinux1_x86_64.whl

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
# ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
