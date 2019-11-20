# Use detectron image as parent image
FROM housebw/detectron:latest

RUN pip install --upgrade pip

# personal package
RUN pip install -U setuptools \
    && pip --no-cache-dir install \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        jupyterlab \
        tqdm \
        matplotlib \
        imgaug
        
# Install OpenCV
RUN pip --no-cache-dir install opencv-python==3.4.5.20
