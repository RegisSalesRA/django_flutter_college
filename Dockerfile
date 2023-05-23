# pull official base image
FROM python:3.10.11-slim-buster

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -qq -y gcc netcat python3-dev libpq-dev

# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY ./ .

CMD python manage.py runserver 0.0.0.0:8000