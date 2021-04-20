FROM python:3.7-alpine
MAINTAINER Brazil App Developer Ltd

ENV PYTHONUNBUFFERED 1

# TO COPY MY LIBS AND CREATE A NEW-ONE
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# TO RUN MY APPLICATION
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# FOR SECURITY
RUN adduser -D user
USER user
