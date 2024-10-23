#!/bin/bash

# Function to display total CPU usage
function cpu_usage {
    echo "Total CPU Usage:"
    # Get total CPU time and calculate usage
    cpu_info=$(ps -eo %cpu --no-headers | awk '{sum += $1} END {print sum}')
    echo "CPU Usage: ${cpu_info}%"
    echo
}

# Function to display total memory usage
function memory_usage {
    echo "Total Memory Usage:"
    # Get total and used memory
    mem_info=$(ps -eo pmem --no-headers | awk '{sum += $1} END {print sum}')
    echo "Memory Usage: ${mem_info}%"
    echo
}

# Function to display total disk usage
function disk_usage {
    echo "Total Disk Usage:"
    # Using df to get disk usage
    disk_info=$(df -h --total | grep 'total' | awk '{print $3 " used, " $4 " free, " $5 " used"}')
    echo "$disk_info"
    echo
}

# Function to display top 5 processes by CPU usage
function top_cpu_processes {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo
}

# Function to display top 5 processes by memory usage
function top_memory_processes {
    echo "Top 5 Processes by Memory Usage:"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    echo
}

#Execute Each Function
cpu_usage
memory_usage
disk_usage
top_cpu_processes
top_memory_processes
