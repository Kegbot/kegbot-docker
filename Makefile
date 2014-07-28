all: containers

containers:
	docker build -t kegbot/mysql mysql
	docker build -t kegbot/redis redis
	docker build -t kegbot/nginx nginx
	docker build -t kegbot/server server
