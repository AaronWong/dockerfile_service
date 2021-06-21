FROM apache/airflow:2.1.0

LABEL maintainer Aaron "aaronwlj@foxmail.com"

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 curl ca-certificates && \
    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list && \
    apt-get purge --autoremove -y curl && \
    rm -rf /var/lib/apt/lists/*

######################################
## CUDA
ENV CUDA_VERSION 11.2.0

# For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-cudart-11-2=11.2.72-1 \
    cuda-compat-11-2 \
    && ln -s cuda-11.2 /usr/local/cuda && \
    rm -rf /var/lib/apt/lists/*

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf \
    && echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

######################################
## NCCL
ENV NCCL_VERSION 2.8.4

RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-cudart-dev-11-2=11.2.72-1 \
    cuda-command-line-tools-11-2=11.2.0-1 \
    cuda-minimal-build-11-2=11.2.0-1 \
    cuda-libraries-dev-11-2=11.2.0-1 \
    cuda-nvml-dev-11-2=11.2.67-1 \
    libnpp-dev-11-2=11.2.1.68-1 \
    libnccl-dev=2.9.9-1+cuda11.3 \
    libcublas-dev-11-2=11.3.1.68-1 \
    libcusparse-dev-11-2=11.3.1.68-1 \
    && rm -rf /var/lib/apt/lists/*

# apt from auto upgrading the cublas package. See https://gitlab.com/nvidia/container-images/cuda/-/issues/88
RUN apt-mark hold libcublas-dev-11-2 libnccl-dev
ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs


######################################
## CUDNN
ENV CUDNN_VERSION 8.1.1.33
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcudnn8=$CUDNN_VERSION-1+cuda11.2 \
    libcudnn8-dev=$CUDNN_VERSION-1+cuda11.2 \
    && apt-mark hold libcudnn8 && \
    rm -rf /var/lib/apt/lists/*


######################################
## detect
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    libopencv-dev \
    vim \
    git \
    g++ \
    make \
    ffmpeg \
    python3-tk

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
    
RUN pip3 install -U setuptools \
    && pip3 --no-cache-dir install \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        tqdm \
        matplotlib \
        opencv-python==3.4.5.20 \
        scenedetect \
        face_recognition \
        torch \
        torchvision \
        tensorboardX \
        tensorflow-gpu==1.15

USER aiflow
