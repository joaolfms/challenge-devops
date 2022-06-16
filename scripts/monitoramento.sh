#!/bin/bash

df -h | grep /dev/sda1 > disk.txt
free -h > mem.txt
iostat -h > disk-cpu.txt
iostat -c -h | grep , > cpu.txt

memtotal=` cat ./mem.txt | awk '/Mem:/ {print $2}'`
memfree=` cat ./mem.txt | awk '/Mem:/ {print $4}'`
memavailable=` cat ./mem.txt | awk '/Mem:/ {print $7}'`
cache=` cat ./mem.txt | awk '/Mem:/ {print $6}'`

disksize=`cat ./disk.txt | awk '/dev/sda1 {print $2, $5}'`
diskfree=`cat ./disk.txt | awk '/dev/sda1 {print $4}'`
readseg=`cat ./disk-cpu.txt | awk '/sda/ {print $2}'`
writeseg=`cat ./disk-cpu.txt | awk '/sda/ {print $3}'`
write=`cat ./disk-cpu.txt | awk '/sda/ {print $6}'`
read=`cat ./disk-cpu.txt | awk '/sda/ {print $5}'`

user=`cat ./cpu.txt | awk ' {print $1}'`
nice=`cat ./cpu.txt | awk ' {print $2}'`
system=`cat ./cpu.txt | awk ' {print $3}'`
iowait=`cat ./cpu.txt | awk ' {print $4}'`
steal=`cat ./cpu.txt | awk ' {print $5}'`
idle=`cat ./cpu.txt | awk ' {print $6}'`

jo -p MemTotal=$memtotal status=$(jo MemFree=$memfree MemAvailable=$memavailable \
MemCache=$cache) Disk=$disksize info=$(jo DiskFree=$diskfree \
 kB_read/s=$readseg kB_wrtn/s=$writeseg kB_read=$read KB_wrtn=$write ) Avg-Cpu=$(jo User=$user \
 Nice=$nice System=$system IoWait=$iowait Steal=$steal Idle=$idle) > index.html
