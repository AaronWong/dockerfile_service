FROM nvcr.io/nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && DEBIAN_FRONTEND=noninteractive apt-get -qqy install python3-pip ffmpeg git less nano libsm6 libxext6 libxrender-dev \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install  \
  imageio==2.3.0 \
  matplotlib==2.2.2 \
  numpy==1.15.0 \
  pandas==0.23.4 \
  Pillow==5.2.0 \
  PyYAML==5.1 \
  scikit-image==0.14.0 \
  scikit-learn==0.19.2 \
  scipy==1.1.0 \
  torch==1.4.0 \
  torchvision==0.2.1 \
  tqdm==4.24.0 \
  librosa==0.7.0 \
  opencv-contrib-python>=4.2.0.34 \
  opencv-python==4.1.0.25 \
  numba==0.48
