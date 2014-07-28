# dockerfile/nginx Dockerfile

# Base image
FROM dockerfile/nginx

ADD kegbot-nginx.conf.tmpl /etc/nginx/sites-available/kegbot.tmpl
ADD run.sh /run.sh
RUN chmod 700 /run.sh

VOLUME  ["/kegbot-data"]
EXPOSE  80
CMD     ["/run.sh"]