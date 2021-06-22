FROM registry.cn-shenzhen.aliyuncs.com/tsinghua_gd/airflow:2.1.0_base

USER root

ENV PATH=${PATH}:/root/.local/bin
RUN pip install --upgrade pip
RUN pip install -U setuptools \
    && pip install \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        tqdm \
        matplotlib \
        opencv-python==3.4.5.20 \
        scenedetect \
        face_recognition \
        torch \
        torchvision \
        tensorboardX \
        tensorflow-gpu==1.15
       
USER aiflow
