FROM python:3.7-alpine
MAINTAINER Brazil App Developer Ltd

ENV PYTHONUNBUFFERED 1

# TO COPY MY LIBS AND CREATE A NEW-ONE
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# TO RUN MY APPLICATION
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# FOR SECURITY
RUN adduser -D user
USER user