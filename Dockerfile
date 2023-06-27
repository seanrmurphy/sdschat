FROM nvidia/cuda:11.7.1-base-ubuntu22.04

ENV SHELL=/bin/bash
LABEL maintainer="Carlos Vivar Rios <carlos.vivarrios@epfl.ch>"

USER root

# Basic Linux tools
RUN apt-get update && apt-get install -y \
    python3-pip \
    apt-utils \
    vim \
    git \
    htop \
    nano

RUN ln -s /usr/bin/python3 /usr/bin/python

# Torch dependencies
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117

# Transformers
RUN pip install transformers \ 
    fschat \ 
    openai \
    accelerate \
    ftfy \
    diffusers \ 
    chromadb \
    langchain \
    nvitop


COPY ./app /app
WORKDIR /app

# start jupyter lab
CMD ["bash","entrypoint.sh"]
EXPOSE 8000
EXPOSE 7860