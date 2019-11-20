# Use Caffe2 image as parent image
FROM housebw/detectron:latest

# personal package
RUN pip install -U setuptools \
    && pip --no-cache-dir install \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        jupyterlab==1.0.2 \
        tqdm \
        matplotlib \
        imgaug
        
# Install OpenCV
RUN pip --no-cache-dir install opencv-python==3.4.5.20
