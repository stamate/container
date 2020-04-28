# FROM tensorflow/tensorflow:1.11.0-gpu-py3
# FROM pytorch/pytorch:latest
# FROM tensorflow/tensorflow:latest-gpu-py3
FROM tensorflow/tensorflow:1.15.2-gpu-py3

RUN apt-get update && apt-get install -y wget zsh git nano

# Install dependencies
WORKDIR /lab
ADD . /lab/container
RUN pip install --upgrade pip
RUN pip install -r /lab/container/requirements.txt
RUN mkdir -p /root/.jupyter
RUN cp /lab/container/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# Add on-my-zsh
RUN curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh || true

# Change shell to zsh
ENV SHELL /bin/zsh
