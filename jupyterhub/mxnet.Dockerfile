From jupyterhub/jupyterhub:latest
LABEL maintainer Aaron "wanglj@ibbd.net"

RUN conda install -y \
    matplotlib=2.2.2 \
    pandas=0.23.4 \
    mxnet==1.5.0b20181215 \
    d2lzh==0.8.11 \