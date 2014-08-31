#!/usr/bin/perl
use strict;
use warnings;

## install ffmpeg, vim, tree, screen, netcat based on OS (debian or redhat)

## output a UUID

## check for sudo access
sudo -v return

## add new user 'elvis' and add to group 'kings'. create group if !exist

cut -d: -f1 /etc/group | grep kings

## report fqdn
hostname -fqd

## change hostname to graceland
hostname graceland
if debian
  edit /etc/hostname
elsif redhat
  edit /etc/sysconfig/network

## count number of cpus
cat /proc/cpuinfo | grep processor | wc -l
