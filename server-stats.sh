#!/bin/zsh

# Server Performance Analysis Script
echo "=============================="
echo "Server Performance Statistics"
echo "=============================="

# OS Version
echo -n "OS Version: "
cat /etc/os-release | grep VERSION= | cut -d '"' -f 2

# Uptime
echo -n "\nUptime: "
uptime -p

# Load Average
echo -n "\nLoad Average: "
cat /proc/loadavg | awk '{print $1, $2, $3}'

# CPU Usage
echo -n "\nTotal CPU Usage: "
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}%'

# Memory Usage
echo "\nMemory Usage:"
free -m | grep Mem: | awk '{printf "Used: %dMB (%.2f%%)\nFree: %dMB", $3, ($3/$2)*100, $4}'

# Disk Usage
echo "\nDisk Usage:"
df -h / | grep -v Filesystem | awk '{printf "Used: %d%s (%d%%)\nAvailable: %d%s", $3, $2, $5, $4, $2}'

# Top 5 Processes by CPU
echo "\nTop 5 Processes by CPU Usage:"
ps aux --sort=-%cpu | head -n 6 | awk '{printf "%d\t%s\t%s\n", $3, $4, $11}'

# Top 5 Processes by Memory
echo "\nTop 5 Processes by Memory Usage:"
ps aux --sort=-%mem | head -n 6 | awk '{printf "%d\t%s\t%s\n", $4, $5, $11}'

# Logged In Users
echo "\nCurrently Logged In Users:"
who | awk '{print $1, $2, $3, $4, $5, $6, $7}'

# Failed Login Attempts (last 10)
echo "\nRecent Failed Login Attempts:"
journalctl -u sshd -n 10 | grep "Failed password" | awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11}'
