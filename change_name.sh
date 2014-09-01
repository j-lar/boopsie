#!/bin/bash
cur_hostname=$(hostname)
new_hostname="graceland"

if (which yum) | grep -q "not found"
then
	echo "Looks like a Red Hat variant. Editing /etc/sysconfig/network."
	sudo sed -i "s/$cur_hostname/$new_hostname/g" /etc/sysconfig/network
else 
	echo "Looks like a Debian variant. Editing /etc/hostname."
	sudo sed -i "s/$cur_hostname/$new_hostname/g" /etc/hostname 
fi

sudo hostname graceland