#! /usr/bin/env bash

####################################################################################
#
# Original Author: Sean Murphy, SDSC. https://gitlab.datascience.ch/hackathon-june2023/intranet-search
#
####################################################################################

# This file runs the services necessary to provide:
# - an OpenAI compatible API server which connects to a model server to handle queries
# - a Gradio web app which provides a chat interface which we can experiment with
# 
# To use the OpenAI API, it is usually necessary to specify a key; this API server
# does not require a key and usually the key is specified and set to 'EMPTY'.

# See a list of models here:
# https://github.com/lm-sys/FastChat/blob/main/docs/model_support.md
# The names of the models seem to be a link to a huggingface repo containing the weights
# These weights get downloaded by the model server

# This is the standard model and should work without issue. There are also 13b and 33b
# versions of this; The 13b version of vicuna seems to work but the 33b version did not.
# The 13b snoozy model did work for me once (first time I tried it) but I have not been
# able to run it subsequently - it seems to have issues loading the weights into the
# GPU.
MODEL="lmsys/vicuna-7b-v1.3"
# MODEL="nomic-ai/gpt4all-13b-snoozy"
export LOGDIR="/tmp/fastchat"

mkdir -p $LOGDIR
cd $LOGDIR

echo
echo "Installing pip dependencies..."
pip install chromadb openai langchain

echo
echo "Running controller..."
python3 -m fastchat.serve.controller &> /dev/null &

# The model names specified below have two purposes:
# - to identify themselves when they receive API calls
# - to register with the controller with these names
# Registration with the controller is important in the context of working with multiple
# models via the gradio web app
sleep 5
echo
echo "Running model server..."
python3 -m fastchat.serve.model_worker --model-names "gpt-3.5-turbo,text-davinci-003,text-embedding-ada-002,vicuna-7b-v1.3" --model-path $MODEL &> /dev/null &

sleep 5
echo
echo "Running OpenAI API server on port 8000..."
python3 -m fastchat.serve.openai_api_server --host localhost --port 8000 &> /dev/null &

# The gradio server needs to be started after the model_worker has registered with
# the controller; the gradio server asks the controller which models it knows about;
# if it is started too soon, then there are no models registered with the controller
# and then the gradio app cannot obtain a list of models to give options to the user.
# To test if a model has been registered and is usable, this command can be used:
#   python3 -m fastchat.serve.test_message --model-name vicuna-7b-v1.3

sleep 30
echo
echo "Running Gradio web app server for chat (port 7860 by default) ..."
python3 -m fastchat.serve.gradio_web_server &> /dev/null &

echo "All services started; see log output in $LOGDIR"
