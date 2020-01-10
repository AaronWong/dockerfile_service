# Pull base image.
FROM nvidia/cuda:10.0-cudnn7-devel

LABEL maintainer Aaron "aaronwlj@foxmail.com"

# Install dependencies
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
        vim
     
# pip 升级
RUN python3 -m pip install --upgrade pip

# 安装基础库
RUN pip3 install -U setuptools
RUN pip3 --no-cache-dir install \
      numpy \
      pandas \
      scipy \
      scikit-learn \
      tqdm \
      matplotlib \
      librosa \
      Unidecode \
      pyaudio \
      jieba3k \
      pypinyin \
      pydub \
      sounddevice \
      falcon \
      inflect

RUN pip3 --no-cache-dir install tensorflow-gpu==1.10.0

# 安装服务常用包
RUN pip3 --no-cache-dir install \
    flask \
    flask-restful \
    flask_jsonrpc \
    fire \
    requests_toolbelt

# 删除 apt lists
RUN rm -rf /var/lib/apt/lists/*

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
