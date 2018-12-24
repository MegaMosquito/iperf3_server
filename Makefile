all: build run

build:
	docker build -t iperf3_server .

dev: build
	-docker rm -f iperf3_server 2> /dev/null || :
	docker run -it --name iperf3_server --net=host --volume `pwd`:/outside iperf3_server /bin/sh

run:
	-docker rm -f iperf3_server 2>/dev/null || :
	docker run -d --name iperf3_server --net=host --volume `pwd`:/outside iperf3_server

exec:
	docker exec -it iperf3_server /bin/sh

stop:
	-docker rm -f iperf3_server 2>/dev/null || :

clean: stop
	-docker rmi iperf3_server 2>/dev/null || :

.PHONY: all build dev run exec stop clean

