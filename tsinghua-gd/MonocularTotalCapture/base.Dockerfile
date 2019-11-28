# create registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/MonocularTotalCapture:base

# Pull base image.
FROM registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/monocular_total_capture:openpose

LABEL maintainer Aaron "aaronwlj@foxmail.com"

RUN python3 -m pip install \
        -i http://mirrors.aliyun.com/pypi/simple/ \
        --trusted-host mirrors.aliyun.com \
        --upgrade pip \
        tensorflow-gpu==1.5.0 \
	    opencv-python==3.4.2.17 \
	    matplotlib==3.0.3

######################################
#            ceres-solver            #
######################################
RUN apt-get install -y --no-install-recommends \
    libgoogle-glog-dev \
    libatlas-base-dev \
    libeigen3-dev \
    libsuitesparse-dev
    
WORKDIR /
RUN wget http://ceres-solver.org/ceres-solver-1.13.0.tar.gz && \
    tar zxf ceres-solver-1.13.0.tar.gz && \
    rm ceres-solver-1.13.0.tar.gz
WORKDIR /ceres-bin
RUN cmake ../ceres-solver-1.13.0
RUN make -j3 && make test && make install

######################################
#               libigl               #
######################################
WORKDIR /
RUN git clone https://github.com/libigl/libigl.git

# OpenGL
RUN apt-get install -y --no-install-recommends \
        libgl1-mesa-dev \
        libglu1-mesa-dev \
        freeglut3-dev \
        libglew-dev \
        glew-utils

# 删除 apt lists
RUN rm -rf /var/lib/apt/lists/*

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
