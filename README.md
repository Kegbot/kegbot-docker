# Kegbot on Docker

Docker support for Kegbot.  

## Quick start

 Requirements:
* Docker 1.12+
* Docker-compose 1.9+

To start Kegbot:
```bash
$ docker-compose up
```

To stop Kegbot:

```bash
$ docker-compose down
```

Data is saved in `~/tmp/kegbot` folder on the local disk so that restarts don't wipe it.
You can create a symbolic link should you choose to save the data somewhere else.


## Credit

Thanks to [@blalor/docker-kegbot-server](https://github.com/blalor/docker-kegbot-server)
and [@dencold/kegbot](https://github.com/dencold/kegbot) for inspiring this
project.
