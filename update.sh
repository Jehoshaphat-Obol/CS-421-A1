#!/bin/bash

# Define log file
LOG_FILE="/var/log/update.log"

# Function to log messages with timestamps
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# Update the Ubuntu package list and upgrade installed packages
log_message "Starting package update..."
apt update && apt upgrade -y
if [ $? -eq 0 ]; then
    log_message "Packages updated successfully."
else
    log_message "Package update failed."
    exit 1
fi

# Pull the latest changes from the GitHub repository
log_message "Pulling latest changes from GitHub repository..."
cd /home/ubuntu/app || exit 1
git pull origin main
if [ $? -eq 0 ]; then
    log_message "Git pull successful."
else
    log_message "Git pull failed. Exiting..."
    exit 1
fi

# Restart the web server (Assuming Apache or Nginx)
log_message "Restarting the web server..."
systemctl restart nginx
if [ $? -eq 0 ]; then
    log_message "Web server restarted successfully."
else
    log_message "Web server restart failed."
    exit 1
fi

log_message "Update process completed successfully."