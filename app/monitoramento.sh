#!/bin/bash

memtotal=`free -h | awk '/Mem:/ {print $2}'`
memfree=`free -h | awk '/Mem:/ {print $4}'`
memavailable=`free -h | awk '/Mem:/ {print $7}'`
cache=`free -h | awk '/Mem:/ {print $6}'`


disksize=`df -h | grep /dev/sda1 | awk '/dev/sda1 {print $2, $5}'`
diskfree=`df -h | grep /dev/sda1 | awk '/dev/sda1 {print $4}'`
readseg=`iostat -h | awk '/sda/ {print $2}'`
writeseg=`iostat -h  | awk '/sda/ {print $3}'`
write=`iostat -h  | awk '/sda/ {print $6}'`
read=`iostat -h  | awk '/sda/ {print $5}'`

user=`iostat -c -h | grep 0.0 | awk ' {print $1}'`
nice=`iostat -c -h | grep 0.0 | awk ' {print $2}'`
system=`iostat -c -h | grep 0.0 | awk ' {print $3}'`
iowait=`iostat -c -h | grep 0.0 | awk ' {print $4}'`
steal=`iostat -c -h | grep 0.0 | awk ' {print $5}'`
idle=`iostat -c -h | grep 0.0 | awk ' {print $6}'`
jo -p MemTotal=$memtotal status=$(jo MemFree=$memfree MemAvailable=$memavailable MemCache=$cache) \
Disk=$disksize info=$(jo DiskFree=$diskfree kB_read/s=$readseg kB_wrtn/s=$writeseg kB_read=$read KB_wrtn=$write ) \
Avg-Cpu=$(jo User=$user  Nice=$nice System=$system IoWait=$iowait Steal=$steal Idle=$idle) > info.json
