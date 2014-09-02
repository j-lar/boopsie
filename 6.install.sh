#!/bin/bash
rh="sudo yum -y install ffmpeg vim tree screen netcat"
deb="sudo apt-get -y install ffmpeg vim tree screen netcat"

## install ffmpeg, vim, tree, screen, netcat based on OS (debian or redhat)
echo "Checking distro family..."
if (which yum) | grep -q "not found"
then
	echo "Looks like a Red Hat variant. Running yum."
	$rh
else 
	echo "Looks like a Debian variant. Running apt-get."
	$deb 
fi