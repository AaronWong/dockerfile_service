FROM python:3.8-slim

# install deps
RUN apt-get update && apt-get -y install \
    bash ffmpeg

# setup RIFE
RUN pip3 install \
    numpy>=1.16 \
    tqdm>=4.35.0 \
    sk-video>=1.1.10 \
    torch>=1.3.0 \
    torchvision \
    opencv-python>=4.1.2 \
    moviepy>=1.0.3 \
    fastapi \
    uvicorn
