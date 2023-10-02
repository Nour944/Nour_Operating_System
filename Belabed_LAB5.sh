#!/bin/bash

# check running processes

check_running_processes() {
    echo "---start checking running processes---"

    echo 'Processes consuming more than 10% CPU':
    ps aux --sort=-%cpu | awk 'NR<=5 {print $0}'
    
    echo "List of all running java processes"
    ps aux | grep 'java'

    echo "List of all the running 'http' processes"
    ps aux | grep 'http'
    
    echo "List of all the running mysql processes"
    ps aux | grep 'mysql'

    echo 'Total number of running processes:'
    ps -e | wc -l
}

# Check of the CPU utilization
check_cpu_utilization() {
    echo "---Checking CPU utilization---"

    echo "CPU Utilization of critical processes"
    ps -eo %cpu,command | egrep '(java|http|mysql)' | awk '$1 > 10 {print $0}'

    echo "Average CPU load in the last 60 seconds"
    uptime | awk '{print $10}'

    echo 'Top 5 most CPU consuming users:'
    top -b -n 1 | grep '^%Cpu' | tail -n 5

    Check CPU core count
    echo 'CPU core count:'
    nproc

}

check_memory_utilization(){
    echo "---Checking Memory Utilization---"


    echo "Display free memory:"
    free -h

    echo "Display swap usage:"
    swapon --show

    echo "5 most memory consuming processes:"
    ps aux --sort=-%mem | awk 'NR<=5 {print $0}'

}

#Function to check for zombie processes
check_zombie_processes() {
    echo"------Checking Zombie Processes -----"

    #Killing zombie processes
    echo "zombie processes:"
    ps aux | awk '$8=="Z" {print "kill -9 "$2}' | sh
    
    # List all zombie processes
    echo "List all zombie processes:"
    ps aux | awk '$8=="Z"'

    #Count of zombie processes
    echo "Count of zombie processes:"
    ps aux | awk '$8=="Z"'|wc -1

    #Parent processes of Zombies
    echo "Parent processes of zombie:"
    ps aux | awk '$8=="Z"{print $3}'

    #User owning zombie processes
    echo "User owning zombie processes:"
    ps aux | awk '$8=="Z"{print $1}'
}

# Function to check load average
check_load_average() {
    echo "Checking Load Average"

     #Current load average
     echo "Current load average:"
     uptime

     #Load average of the last 5 minutes
     echo "Load average of the last 5 minutes:"
     uptime | awk '{print $11}'

     #Load average of the last 15 minutes
     echo "Load average of the last 15 minutes:"
     uptime | awk '{print $12}'
    
    #Number of currently running processes
     echo "Number of currently running processes:"
     uptime | awk '{print $6}'

     #Number of  users currently logged in
     echo "Number of  user currently logged in:"
     uptime | awk '{print $4}'

}

# Function to check Disk/SAN/NAS utilization
check_disk_utilization(){
    echo "----Checking Disk/SAN/NAS utilization-----"

    #Disk I/O statistics
    echo "Disk I/O statistics:"
    iostat

    #Disk usage
    echo "Disk usage:"
    df -h

    #Inode usage
    echo "Inode usage:"
    df -i

    #List mounted filesystems
    echo "List mounted filesystems:"
    mount | column -t

    #Display disk partitions and sizes
    echo "Display disk partitions and sizes:"
    fdisk -1
}

#Main function to call all checks
main (){
    check_running_processes
    check_cpu_utilization
    check_memory_utilization
    check_zombie_processes
    check_load_average
    check_disk_utilization
}
#Execute main function
main

Writing enhanced_server_health_check.sh

#Make the script executable
!chmod +x enhanced_server_health_check.sh

