FROM nvcr.io/nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04

# install deps
RUN apt-get update && apt-get -y install \
    bash ffmpeg python3-pip

# setup RIFE
RUN pip3 install --upgrade pip
RUN pip3 install \
    numpy>=1.16 \
    tqdm>=4.35.0 \
    sk-video>=1.1.10 \
    torch==1.4.0 \
    torchvision==0.5.0 \
    opencv-python>=4.1.2 \
    moviepy>=1.0.3 \
    fastapi \
    uvicorn
