FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y \
    python-pip \
 && rm -rf /var/lib/apt/lists/*

RUN python -m pip install --upgrade pip

RUN mkdir /SqueezeSegV2

COPY . /SqueezeSegV2/.

RUN cd /SqueezeSegV2 \
 && python -m pip install -r requirements.txt

WORKDIR /SqueezeSegV2

CMD ["python", "src/demo.py"]
