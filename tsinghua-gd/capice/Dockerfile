FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
        wget \
        vim \
        python3-dev \
        python3-pip

WORKDIR /tmp
RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN bash Miniconda2-latest-Linux-x86_64.sh -p $HOME/miniconda2 -b
ENV PATH=$HOME/miniconda2/bin:$PATH
RUN conda install -c conda-forge -c bioconda snakemake
RUN rm -r /tmp

RUN pip3 install -U setuptools \
    && pip3 --no-cache-dir install \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        xgboost \
        tqdm \
        matplotlib
