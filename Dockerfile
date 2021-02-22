FROM tensorflow/tensorflow:latest-gpu-py3

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    ca-certificates \
    build-essential \
    git \
    cmake \
    wget \
    vim \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install jupyterlab
RUN pip install matplotlib

WORKDIR /root 

CMD jupyter lab --port=8888 --no-browser --ip=0.0.0.0 --allow-root
