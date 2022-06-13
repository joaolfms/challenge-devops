#!/bin/bash
# echo "MemFree Buffers Cached  SwapFree  cpu  disco">log-memoria-cpu-disco.txt
mfree=` cat /proc/meminfo | (awk '/MemFree/ {print $2}'/etc/lsb-release)`
# buff=` cat /proc/meminfo | awk '/Buffers/ {print $2}'`
# cach=` cat /proc/meminfo | awk '/Cached/ {print $2}'`
# swapfree=` cat /proc/meminfo | awk '/SwapFree/ {print $2}'`
# cpu=` cat /proc/stat | awk '/cpu/ {print $2}'`
# disc=`cat /proc/stat | awk '/disk/ {print $6}'`
echo $mfree >> log-memoria-cpu-disco.json
