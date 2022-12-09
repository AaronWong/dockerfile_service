From nvcr.io/nvidia/pytorch:22.01-py3

RUN pip3 install \
  numpy \
  --pre torch[dynamo] \
  torchvision \
  torchaudio \
  --force-reinstall \
  --extra-index-url https://download.pytorch.org/whl/nightly/cu116
