# iperf3 Server
  
This container starts an iperf3 server.  See https://github.com/esnet/iperf for details.

The server binds to all interfaces the host's network and offers the iperf3 service on port 5862.

Deploy this container on one host in your local area network, and then run the iperf client software on another host in the network to get a measure of your network's performance between those two hosts.

