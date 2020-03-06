# https://github.com/oarriaga/face_classification/blob/dependabot/pip/tensorflow-1.15.2/Dockerfile
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get install -y git python3-pip python3-dev python3-tk vim procps curl

#Face classificarion dependencies & web application
RUN pip3 install numpy scipy scikit-learn pillow tensorflow pandas h5py opencv-python==3.2.0.8 keras statistics pyyaml pyparsing cycler matplotlib Flask

RUN git clone https://github.com/oarriaga/face_classification.git /face-classifier

WORKDIR /face-classifier
RUN git checkout dependabot/pip/tensorflow-1.15.2 

ENV PYTHONPATH=$PYTHONPATH:src
ENV FACE_CLASSIFIER_PORT=8084
EXPOSE $FACE_CLASSIFIER_PORT

ENTRYPOINT ["python3"]
CMD ["src/web/faces.py"]
