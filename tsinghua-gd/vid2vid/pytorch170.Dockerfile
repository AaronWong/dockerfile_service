FROM nvcr.io/nvidia/pytorch:20.08-py3

RUN apt-get update && apt-get install -y rsync htop git openssh-server
#RUN apt-get install python3-pip -y
#RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install --upgrade pip
RUN pip install -U setuptools

#Torch and dependencies:
#RUN pip install https://download.pytorch.org/whl/cu100/torch-1.1.0-cp35-cp35m-linux_x86_64.whl
#RUN pip install https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp35-cp35m-linux_x86_64.whl
RUN pip install tensorflow cffi tensorboardX
RUN pip install tqdm scipy scikit-image colorama==0.3.7
RUN pip install setproctitle pytz ipython

#vid2vid dependencies
RUN apt-get install libglib2.0-0 libsm6 libxrender1 -y
RUN pip install dominate requests opencv-python==3.4.5.20

# 安装基础库
RUN pip --no-cache-dir install \
    numpy \
    pandas \
    scipy \
    scikit-learn \
    jupyterlab \
    tqdm \
    matplotlib \
    imgaug

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    wget \
    vim
