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
    nano \
    curl \
    tmux

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN useradd -ms /bin/bash sdsc
USER sdsc
WORKDIR /home/sdsc

#ARG UID=10001
#RUN adduser \
#    --disabled-password \
#    --gecos "" \
#    --home "/home/sdsc" \
#    --shell "/bin/bash" \
#    --uid "${UID}" \
#    sdsc
#
#USER sdsc
#WORKDIR /home/sdsc

COPY ./requirements.txt /home/sdsc
RUN pip install -r requirements.txt 

COPY ./openai_api_server.py /home/sdsc/.local/lib/python3.10/site-packages/fastchat/serve

COPY ./app /home/sdsc/app
# COPY ./app /app

USER root
RUN chmod 777 /home/sdsc/app/entrypoint.sh
RUN chown -R sdsc:sdsc /home/sdsc
USER sdsc
ENV HOME=/home/sdsc

# start jupyter lab
CMD ["bash","/home/sdsc/app/entrypoint.sh"]
EXPOSE 8000
EXPOSE 7860
