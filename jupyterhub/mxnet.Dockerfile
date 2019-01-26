From jupyterhub/jupyterhub:latest
LABEL maintainer Aaron "wanglj@ibbd.net"

RUN conda install -y \
    matplotlib \
    pandas \
    mxnet 
RUN python3 -m pip install --no-cache-dir d2lzh