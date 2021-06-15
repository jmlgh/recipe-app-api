FROM python:3.7-alpine

# recommended for running python within a Docker container
# output will not be buffered
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app/

# create a user that will only run applications and processes (-D)
RUN adduser -D user
# switch to that user so we don't run commands as root
USER user

