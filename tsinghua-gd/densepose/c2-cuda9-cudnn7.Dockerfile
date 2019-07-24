# create densepose:c2-cuda9-cudnn7

# Use Caffe2 image as parent image
FROM caffe2/caffe2:snapshot-py2-cuda9.0-cudnn7-ubuntu16.04

RUN mv /usr/local/caffe2 /usr/local/caffe2_build
ENV Caffe2_DIR /usr/local/caffe2_build

ENV PYTHONPATH /usr/local/caffe2_build:${PYTHONPATH}
ENV LD_LIBRARY_PATH /usr/local/caffe2_build/lib:${LD_LIBRARY_PATH}

# Clone the Detectron repository
RUN git clone https://github.com/AaronWong/DensePose /densepose

# Install Python dependencies
RUN pip install -r /densepose/requirements.txt

# Install the COCO API
RUN git clone https://github.com/cocodataset/cocoapi.git /cocoapi
WORKDIR /cocoapi/PythonAPI
RUN make install

# Go to Densepose root
WORKDIR /densepose

# Set up Python modules
RUN make

# [Optional] Build custom ops
RUN make ops

# install wget
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    wget
    
# get_densepose_uv
WORKDIR /densepose/DensePoseData
RUN bash get_densepose_uv.sh
# Go to Densepose root
WORKDIR /densepose

# 安装基础库
RUN pip install --upgrade pip \
    && pip install -U setuptools \
    && pip --no-cache-dir install \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        flask \
        flask_jsonrpc \
        tqdm \
        imgaug \
        jupyterlab \
        matplotlib
