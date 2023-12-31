#!/bin/bash

# Explanation of the cron job:
# This script will be executed automatically every Friday at 11 PM.
# The cron job entry can be set up using the following line in the crontab file:
# 0 23 * * 5 /path/to/your/script.sh

# Display a message indicating the script is starting
echo "Starting the server update and package upgrade script..."

# Update the server
sudo apt-get update && sudo apt-get upgrade -y

# Get the count of upgradable packages
upgrade_count=$(apt list --upgradable 2>/dev/null | wc -l)

# Create a filename with the current date in the format updateMM.DD.YY.txt
filename="update$(date +'%m.%d.%y').txt"

# Create a new file and write the upgrade count information
echo "$upgrade_count packages can be upgraded." > "$filename"

# Display the upgrade count message on the screen
echo "$upgrade_count packages can be upgraded."

# Display a message indicating the script has finished
echo "Script completed."

# Exit the script
exit 0
