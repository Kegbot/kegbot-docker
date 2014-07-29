# Kegbot on Docker

Docker support for Kegbot.  Bit of a work in progress.

## Quick start

```
### Create the data directory somewhere on the host.
export KEGBOT_DATA=/tmp/kegbot-data
mkdir -p $KEGBOT_DATA

### Run the containers.
docker run --detach --name=kegbot-mysql kegbot/mysql

docker run --detach --name=kegbot-redis kegbot/redis

docker run --detach --name=kegbot-server -v $KEGBOT_DATA:/kegbot-data \
    --link kegbot-redis:redis --link kegbot-mysql:mysql \
    kegbot/server:latest

docker run --name=kegbot-nginx -v $KEGBOT_DATA:/kegbot-data -p 80:80 \
    --detach --link kegbot-server:kegbot_server kegbot/nginx:latest
```

## Credit

Thanks to [@blalor/docker-kegbot-server](https://github.com/blalor/docker-kegbot-server)
and [@dencold/kegbot](https://github.com/dencold/kegbot) for inspiring this
project.