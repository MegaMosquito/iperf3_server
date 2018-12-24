FROM ubuntu
WORKDIR /usr/src/app

# Install build tools, etc.
RUN apt-get update && apt-get install -y build-essential wget curl jq vim

RUN wget https://downloads.es.net/pub/iperf/iperf-3.6.tar.gz
RUN tar -xvf iperf-3.6.tar.gz
RUN cd iperf-3.6; ./configure; make; make install

RUN ldconfig

# Run the daemon
CMD iperf3 -s -B 0.0.0.0 -p 5862

