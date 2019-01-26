From jupyterhub/jupyterhub:latest
LABEL maintainer Aaron "wanglj@ibbd.net"

RUN conda install -y \
    matplotlib \
    pandas \
    mxnet \
    d2lzh \