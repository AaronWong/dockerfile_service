FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04

ENV TORCH_CUDA_ARCH_LIST "5.2 6.0. 6.1 7.0 7.5 8.0+PTX"
RUN apt-get update
RUN apt-get install python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install --upgrade pip
RUN pip3 install -U setuptools

# 安装基础库
RUN pip3 --no-cache-dir install \
    numpy \
    pandas \
    scipy \
    tqdm \
    matplotlib \
    imgaug

RUN pip3 install --pre torch==1.7.0.dev20200819 torchvision -f https://download.pytorch.org/whl/nightly/cu102/torch_nightly.html

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    wget \
    vim
