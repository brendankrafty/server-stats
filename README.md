# Server Performance Analysis Script

A comprehensive shell script to analyze and monitor key server performance metrics.

## Features

This script provides detailed insights into server performance by displaying the following statistics:

- **OS Version**: Displays the server's operating system version
- **Uptime**: Shows how long the server has been running
- **Load Average**: Displays the system load average for the last 1, 5, and 15 minutes
- **CPU Usage**: Shows current CPU utilization percentage
- **Memory Usage**: Displays used and free memory with percentage utilization
- **Disk Usage**: Shows used and available disk space with percentage utilization
- **Top Processes**: Lists the top 5 processes by:
  - CPU Usage
  - Memory Usage
- **User Activity**: Shows currently logged in users
- **Security**: Displays recent failed SSH login attempts

## Installation

1. Clone this repository:
```bash
git clone https://github.com/brendankrafty/server-stats.git
cd server-performance-script
```

2. Make the script executable:
```bash
chmod +x server-stats.sh
```

## Usage

1. Run the script as a normal user:
```bash
./server-stats.sh
```

## Troubleshooting

If you get a "required file not found" error, ensure that you have a shell installed:
  ```bash
  sudo apt install zsh
  ```

