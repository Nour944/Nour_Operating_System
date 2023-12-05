%%writefile lab_session.sh

#!/bin/bash

# Lab Session: Analyzing and Storing Logs and Archiving Files

# Part 1: Analyzing and Storing Logs

# Step 1: View System Logs
echo "Step 1: Viewing System Logs"
cat /var/log/syslog
echo

# Step 2: Filter Logs for SSH Connections
echo "Step 2: Filtering Logs for SSH Connections"
cat /var/log/syslog | grep ssh
echo

# Step 3: Store Filtered Logs in a File
echo "Step 3: Storing Filtered Logs in ssh_logs.txt"
cat /var/log/syslog | grep ssh > ssh_logs.txt
echo "Filtered logs stored in ssh_logs.txt"