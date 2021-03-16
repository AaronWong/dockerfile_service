FROM nvidia/cuda:11.2.1-cudnn8-devel-ubuntu18.04


RUN apt-get update -y && \
    apt-get install -y \
    wget \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/li
    
RUN wget https://github.com/ethereum-mining/ethminer/releases/download/v0.18.0/ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz && \
    tar -xvf ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz && \
    chmod +x /bin/ethminer && \
    rm ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz

WORKDIR /bin/

ENTRYPOINT ["./ethminer"]
