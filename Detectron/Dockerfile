# Use detectron image as parent image
FROM housebw/detectron:latest

RUN pip install --upgrade pip

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
        
# personal package
RUN pip3 install -U setuptools \
    && pip3 --no-cache-dir install \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        jupyterlab \
        tqdm \
        matplotlib \
        imgaug
        
# Install OpenCV
RUN pip3 --no-cache-dir install opencv-python==3.4.5.20
