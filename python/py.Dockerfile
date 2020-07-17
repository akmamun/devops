#image 
FROM python:3.8.2-slim-buster
LABEL maintainer="Mamun <akmamun004@gmail.com>"
#update and install essential dependencies 
RUN apt-get update && apt-get install --qq -y \
    build-essential libpq-dev --fixed-missing --no-install-recommends

# working directory
WORKDIR /app
#copy requirements 
COPY requirements.txt requirements.txt
#install requirements 
RUN pip install -r requirements.txt
#copy everythings 
COPY . .
VOLUME [ "static" ]
CMD gunicorn -b 0.0.0.0:8000 "app:create_app()"