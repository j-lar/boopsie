#!/bin/bash

if ! (cut -d: -f1 /etc/group) | grep -q kings
then sudo groupadd kings
fi
sudo useradd -G kings elvis
