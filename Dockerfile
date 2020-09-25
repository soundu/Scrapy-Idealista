FROM python:3.8-slim

# ENV
COPY idealista /app/idealista
COPY scrapy.cfg /app
COPY requirements.txt /app
COPY entrypoint.sh /app

# APP DIR
WORKDIR /app

# INSTALL REQUIREMENTS
RUN apt update                                              && \
    apt install -y build-essential --no-install-recommends  && \
    pip install -r requirements.txt

# VOLUMES
VOLUME [ "/data" ]

# ENTRYPOINT
ENTRYPOINT [ "bash", "entrypoint.sh" ]