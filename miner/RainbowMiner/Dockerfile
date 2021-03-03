FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

#Setup basic Ubuntu Server
RUN apt-get update && apt-get install -y ubuntu-server
RUN apt-get install --no-install-recommends -y systemd liblttng-ust0 vim iputils-ping git software-properties-common wget dkms build-essential nano

#Install powershell
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.2/powershell_7.1.2-1.ubuntu.20.04_amd64.deb
RUN dpkg -i powershell_7.1.2-1.ubuntu.20.04_amd64.deb && apt-get install -f
RUN rm powershell_7.1.2-1.ubuntu.20.04_amd64.deb

#Download & Install RainbowMiner
RUN git clone https://github.com/rainbowminer/RainbowMiner
WORKDIR RainbowMiner
RUN  chmod +x *.sh && ./install.sh
