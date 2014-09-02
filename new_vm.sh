#!/bin/bash
sudo ubuntu-vm-builder kvm trusty \
				  --hostname boopsie_test \
				  --addpkg openssh-server 
				  --ip 10.0.0.122 \
                  --mask 255.255.255.0 \
                  --net 10.0.0.0 \
                  --bcast 10.0.0.255 \
                  --gw 10.0.0.1 \
                  --dns 10.0.0.1 \
				  --components main,universe \
				  --libvirt qemu:///system ;

virsh start boopsie_test
vir