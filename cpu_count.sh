#!/bin/bash
echo "The number of processors on this system is:"
cat /proc/cpuinfo | grep processor | wc -l
