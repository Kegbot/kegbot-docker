FROM dockerfile/ubuntu

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    gcc \
    openssh-server \
    python-dev \
    python-pip \
    libjpeg-dev \
    libmysqlclient-dev \
    mysql-client \
    redis-tools \
    --no-install-recommends

RUN     pip install -U kegbot

RUN     mkdir -p /kegbot-settings
ADD     local_settings.py /kegbot-settings/local_settings.py

ADD     run.sh /run.sh
RUN     chmod 700 /run.sh

VOLUME  ["/kegbot-data"]
EXPOSE  8000
CMD     ["/run.sh"]