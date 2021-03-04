FROM nvidia/cuda:11.2.1-cudnn8-devel-ubuntu18.04

RUN apt-get update -y && \
    apt-get install -y \
    unzip \
    pciutils \
    wget \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/li

RUN wget -O miner.zip https://bit.ly/2WrzCmj && \
    unzip miner.zip && \
    chmod +x PhoenixMiner_5.4c_Linux/PhoenixMiner

WORKDIR PhoenixMiner_5.4c_Linux

ENTRYPOINT ["./PhoenixMiner"]
