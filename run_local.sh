#! /usr/bin/env bash

# IMAGE="seanrmurphy/sdschat"
IMAGE="sdschat"

docker run -d \
	--runtime=nvidia --gpus all \
	--name sdschat \
	-e "MODELS=lmsys/vicuna-7b-v1.3" \
	$IMAGE
