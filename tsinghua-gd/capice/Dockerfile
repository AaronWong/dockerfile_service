FROM snakemake/snakemake

RUN apt-get update && apt-get install -y \
        wget \
        vim \
        python3-dev \
        python3-pip

RUN pip3 install -U setuptools \
    && pip3 --no-cache-dir install \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        xgboost \
        tqdm \
        matplotlib
