#image 
FROM python:3.6.8
#update and install essential dependencies 
RUN apt-get update 
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
#run command
CMD ["gunicorn", "django_app_name.wsgi:application", "--bind", "0.0.0.0:8000"]

