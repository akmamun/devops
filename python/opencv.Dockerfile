#base image
FROM python:3.8.6-slim-buster

RUN apt-get update 
RUN apt-get install -y libgl1-mesa-dev
RUN apt-get -y install libglib2.0-0 
RUN apt-get -y install libsm6 \ 
        libxrender-dev \ 
        libxext6

RUN pip3 install --upgrade pip

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# working directory
WORKDIR /app

##copy requirements 
COPY requirements.txt /tmp/requirements.txt
#install requirements 
RUN pip install -r /tmp/requirements.txt
#copy everythings  
COPY . .
