#base image
FROM python:3.8.6-slim-buster

# update and opencv dependencies install
RUN apt-get update && apt-get install -y libgl1-mesa-dev \
    libglib2.0-0 \ 
    libsm6 \ 
    libxrender-dev \ 
    libxext6    

# upgrade pip
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
