#!/bin/bash

echo "================================"
echo "    Server Performance Stats "
echo "================================"

echo ""
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "User: " 100-$8 "%"}'
echo ""

echo ""
echo "Memory Usage: "
free -h | awk 'NR===2{printf "used: %s / total: %s (%.2f%%)\n", $3,$2,$3*100/$2}'
echo ""

echo ""
echo "Disk Usage: "
df -h --total | grep total | awk '{printf "Disk Usage: %s / Total: %s (%s used)\n", $3,$2,$5 }'
echo ""

echo ""
echo "Top 5 Processes by CPU Usage: "
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""

echo ""
echo "🐏 Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo ""

echo "=============================="
echo "        END OF REPORT"
echo "=============================="