#!/bin/bash

apt-get install flex
apt-get install byacc
wget http://www.tcpdump.org/release/libpcap-1.6.1.tar.gz
cd libpcap-1.6.1
sh configure
wget http://www.tcpdump.org/release/tcpdump­4.6.1.tar.gz
tar -xvzf tcpdump­-4.6.1.tar.gz
cd tcpdump­-4.6.1
sh configure
make
if sh tests/TESTrun.sh | grep -v '^.*\s0.*failed.*$'
	then echo "Tests ran successfully."
fi
sudo make install
### run tcpdump for something to test it.
tcpdump -w test.pcap -i eth1 tcp port 22
if [ -s /tmp/f1 ]
	then echo "tcpdump is working!"
