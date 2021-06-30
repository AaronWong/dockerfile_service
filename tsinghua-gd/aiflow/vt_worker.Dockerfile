FROM apache/airflow:2.1.0

USER root

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    ffmpeg

USER aiflow
