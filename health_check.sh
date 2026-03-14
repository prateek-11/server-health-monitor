#!/bin/bash

echo "===== Server Health Report ====="

echo ""
echo "Disk Usage"
df -h

echo ""
echo "Memory Usage"
free -m

echo ""
echo "CPU Usage"
top -bn1 | grep "Cpu"

echo ""
echo "Top 5 Processes"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
