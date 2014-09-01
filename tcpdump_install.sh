#!/bin/bash

wget http://www.tcpdump.org/release/tcpdump­4.6.1.tar.gz
tar -xvzf tcpdump­4.6.1.tar.gz
sh configure.sh
make
make test
sudo make install
### run tcpdump for something to test it.
