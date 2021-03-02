FROM nvidia/cuda:11.2.0-runtime-ubuntu20.04

MAINTAINER aaron

WORKDIR /
ENV DEBIAN_FRONTEND=noninteractive 
# Package and dependency setup
RUN apt update -y && apt install -y wget nvidia-settings

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100
