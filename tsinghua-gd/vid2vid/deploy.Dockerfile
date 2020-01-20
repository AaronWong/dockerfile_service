FROM registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/vid2vid:cp35-cuda100-cudnn7

# 安装基础库
RUN pip3 --no-cache-dir install \
    flask \
    flask-restful \
    flask_jsonrpc \
    fire \
    requests_toolbelt

# ffmpeg
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    pkg-config \
    clang \
    libfdk-aac-dev \
    libspeex-dev \
    libx264-dev \
    libx265-dev \
    libnuma-dev \
    ffmpeg
