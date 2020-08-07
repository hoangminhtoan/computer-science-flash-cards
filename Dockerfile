FROM python:3.6
#MAINTAINER Toan Hoang <hoangminhtoant2l1@gmail.com>

ADD . /src
WORKDIR /src
RUN pip install --upgrade pip \
    && pip install flask gunicorn

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME /src/db

EXPOSE 8000
CMD ["/entrypoint.sh"]


