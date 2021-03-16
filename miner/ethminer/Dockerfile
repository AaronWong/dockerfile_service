FROM nvidia/cuda:11.2.1-cudnn8-devel-ubuntu18.04

RUN wget -O ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz && \
    tar -xvf ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz && \
    chmod +x ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64/bin/ethminer

WORKDIR ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64/bin/

ENTRYPOINT ["./ethminer"]
