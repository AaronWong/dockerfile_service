From nvcr.io/nvidia/tensorflow:20.08-tf1-py3

LABEL maintainer Aaron "aaronwlj@foxmail.com"
      
RUN pip3 --no-cache-dir install \
      jieba3k \
      pypinyin \
      pydub \
      sounddevice \
      falcon \
      inflect \
      librosa \
      Unidecode
      
# 安装服务常用包
RUN pip3 --no-cache-dir install \
    flask \
    flask-restful \
    flask_jsonrpc \
    fire \
    requests_toolbelt
