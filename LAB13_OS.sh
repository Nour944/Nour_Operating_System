%%writefile corn_guid_script.sh


#!/bin/bash


# Comprehensive Cron Guide for Ubuntu
# Author: Prof. Mehdi Pirahandeh, ISE Department
# This script provides a layered approach to understanding Cron on Ubuntu, suitable for all levels.

echo "Cron Guide for Ubuntu: From Basic to Advanced"

# Part 1: Basic Information
# Cron is a time-based job scheduler in Unix-like operating systems, including Ubuntu.
# It enables users to schedule jobs (commands or scripts) to run periodically at fixed times, dates, or intervals.
echo "---- Part 1: Basic Information ----"
echo "Cron is used to schedule commands at a specific time. These scheduled commands are called 'Cron jobs'."
echo "Cron Jobs are defined in a 'crontab', which is a configuration file that specifies shell commands to run periodically on a given schedule."

# Basic Example: Running a command every day at 5 PM
echo "Basic Example: To run a command every day at 5 PM, you would add the following line to your crontab:"
echo "0 17 * * * /path/to/command"

# Part 2: Intermediate Information
# Understanding Cron Syntax:
# The syntax for a cron job is:
# .---------------- minute (0 - 59)
# | .------------- hour (0 - 23)
# | | .---------- day of month (1 - 31)
# | | | .------- month (1 - 12) OR jan,feb,mar,apr ...
# | | | | .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# | | | | |
# * * * * * command to be executed
echo "---- Part 2: Intermediate Information ----"
echo "Intermediate Example: To run a script at 3 AM every Monday, the crontab entry would be:"
echo "0 3 * * 1 /path/to/script.sh"

# Intermediate Example: Editing Crontab
echo "To edit your crontab, you use the command 'crontab -e'. This opens your crontab file in the default text editor."

# Part 3: Advanced Information
# Advanced Cron Jobs involve setting up conditional execution, error logging, and complex scheduling.
echo "---- Part 3: Advanced Information ----"
echo "Advanced Example 1: Conditional Execution"
echo "0 5 * * * [ -f /path/to/check_file ] && /path/to/execute_if_file_exists"

echo "Advanced Example 2: Error Logging"
echo "30 22 * * * /path/to/daily_backup.sh > /var/log/backup.log 2>&1"

echo "Advanced Example 3: Complex Scheduling"
echo "0 20 * * 1-5 /path/to/workday_shutdown.sh # Runs at 8 PM on weekdays"

# Advanced Example: Special Characters
echo "Special characters like '*', '/', and ',' can be used for more complex time specifications."

# Conclusion
echo "This script offers a tiered exploration of Cron, from basic to advanced use. To learn more, try editing your crontab and adding your own jobs."

# End of script

| learning_cron_script |

%%writefile learning_cron_script.sh
#!/bin/bash
# Lab Session: Introduction to Cron Scheduling in Ubuntu
# Author: Prof. Mehdi Pirahandeh, ISE Department
# This script is a beginner's guide to understanding and using cron scheduling in Ubuntu.

# Step 1: Check if Cron is installed
# Cron usually comes pre-installed on Ubuntu, but we'll check to be sure.
echo "Checking if Cron is installed..."
if ! command -v cron &> /dev/null
then
 echo "Cron is not installed. Installing now..."
 sudo apt-get update
 sudo apt-get install cron
else
 echo "Cron is already installed."
fi

# Step 2: Ensure the Cron service is running
echo "Ensuring the Cron service is running..."
sudo service cron start

# Step 3: Basic Introduction to Crontab
# Crontab (Cron table) is a file that contains the schedule of cron entries to be run.
echo "Opening the crontab file for the current user..."
crontab -l

# Step 4: Adding Cron Jobs
# Now, we will add a few simple cron jobs as examples.

# Example 1: Run a script every minute
# This cron job runs a script every minute. We will create a simple script for this purpose.
echo "Creating a sample script to be run every minute..."
echo "#!/bin/bash" > ~/cron_example_script.sh
echo "echo 'Cron job ran at $(date)'" >> ~/cron_example_script.sh
chmod +x ~/cron_example_script.sh
(crontab -l 2>/dev/null; echo "* * * * * ~/cron_example_script.sh") | crontab -
echo "Added a cron job to run a script every minute."

# Example 2: Schedule a job for a specific time
# This cron job is scheduled to run at 10 AM every day.
(crontab -l 2>/dev/null; echo "0 10 * * * echo 'Good morning! Time is 10 AM' >> ~/cron_good_morning.txt") | crontab -
echo "Added a cron job to run at 10 AM every day."

# Example 3: Schedule a job to run on a specific day of the week
# This cron job is scheduled to run at 8 PM every Friday.
(crontab -l 2>/dev/null; echo "0 20 * * 5 echo 'Happy Friday!' >> ~/cron_friday.txt") | crontab -
echo "Added a cron job to run at 8 PM every Friday."

# Example 4: Schedule a job to run every hour
# This cron job runs at the beginning of every hour.
(crontab -l 2>/dev/null; echo "0 * * * * echo 'Hourly reminder' >> ~/cron_hourly.txt") | crontab -
echo "Added a cron job to run at the beginning of every hour."

# Example 5: Schedule a job to run on specific months
# This cron job runs at noon on the first day of January and July.
(crontab -l 2>/dev/null; echo "0 12 1 1,7 * echo 'Happy New Year and Mid-Year!' >> ~/cron_biannual.txt") | crontab -
echo "Added a cron job to run at noon on the first day of January and July."

# Example 6: Schedule a job to run every 5 minutes
(crontab -l 2>/dev/null; echo "*/5 * * * * echo 'This runs every 5 minutes' >> ~/cron_every_5_minutes.txt") | crontab -
echo "Added a cron job to run every 5 minutes."

# Example 7: Schedule a job to run at 2:15 PM on weekdays
(crontab -l 2>/dev/null; echo "15 14 * * 1-5 echo '2:15 PM on Weekdays' >> ~/cron_weekdays.txt") | crontab -
echo "Added a cron job to run at 2:15 PM on weekdays."

# Example 8: Schedule a job to run on the first day of every month
(crontab -l 2>/dev/null; echo "0 0 1 * * echo 'First Day of the Month' >> ~/cron_first_day_month.txt") | crontab -
echo "Added a cron job to run on the first day of every month."

# Example 9: Schedule a job to run every 30 seconds
# Cron does not support a

| learning_docker_script |

%%writefile learning_docker_script.sh
#!/bin/bash
# Lab Session: Introduction to Docker on Ubuntu
# Author: Prof. Mehdi Pirahandeh, ISE Department
# This script is a beginner's guide to install, run, and work with Docker on Ubuntu.

# Step 1: Update the system
# This command updates the list of packages and their versions on your system.
sudo apt-get update

# Step 2: Install prerequisite packages
# These packages are necessary for Docker to run on Ubuntu.
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

# Step 3: Add Docker’s official GPG key
# This key is required to ensure the integrity and authenticity of Docker packages.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Step 4: Add Docker repository to APT sources
# This adds Docker's repository to the list of sources for software packages.
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Step 5: Update the package database with Docker packages from the newly added repo
sudo apt-get update

# Step 6: Install Docker
# This command installs Docker onto your system.
sudo apt-get install docker-ce

# Step 7: Verify Docker installation
# This checks if Docker is installed correctly and is running.
sudo docker --version
echo "Docker has been installed successfully!"

# Step 8: Run a test Docker container
# Here we run a simple hello-world container to verify Docker is working correctly.
echo "Running a test Docker container..."
sudo docker run hello-world

# Step 9: Basic Docker Commands
# Below are some basic Docker commands for managing Docker containers and images.
# List all running containers
echo "To list all running Docker containers, use: sudo docker ps"
# List all containers, including those not running
echo "To list all containers, use: sudo docker ps -a"
# List all Docker images on this system
echo "To list all Docker images, use: sudo docker images"

# Step 10: Conclusion
# This marks the end of this basic Docker lab session.
echo "This concludes the basic Docker lab session. Explore more to learn Docker's full capabilities!"