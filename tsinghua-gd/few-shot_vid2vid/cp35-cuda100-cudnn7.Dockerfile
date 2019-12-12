FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

RUN apt-get update && apt-get install -y rsync htop git openssh-server
RUN apt-get install python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip install --upgrade pip
RUN pip install -U setuptools

#Torch and dependencies:
RUN pip install torch==1.2.0 torchvision==0.4.0 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install tensorflow cffi tensorboardX
RUN pip install tqdm scipy==1.2.1 scikit-image colorama==0.3.7
RUN pip install setproctitle pytz ipython

#vid2vid dependencies
RUN apt-get install libglib2.0-0 libsm6 libxrender1 -y
RUN pip install dominate requests opencv-python==3.4.5.20

#vid2vid install
RUN git clone https://github.com/NVlabs/few-shot-vid2vid.git /few-shot-vid2vid
WORKDIR /few-shot-vid2vid
#download flownet2 model dependencies
#WARNING: we had an instance where these scripts needed to be re-run after the docker instance was launched
RUN python scripts/download_flownet2.py

# 安装基础库
RUN pip --no-cache-dir install \
    numpy \
    pandas \
    scikit-learn \
    jupyterlab \
    matplotlib \
    imgaug

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    wget \
    vim
