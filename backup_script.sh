#!/bin/bash
#Version-02
#Author- Sandeep Kale
##########The is Backup_script #########
#!/bin/bash

# Print greeting message
echo -e "\n ******** Hello! $(whoami) ********"
echo " ================================ "

# Prompt user for input
echo -e "\n Get backup of New directory \n "
read -p "Enter the Source directory name: " SDN
read -p "Enter the Destination directory name: " DDN

# Check if source and destination directories already exist
if [ -d "$SDN" ] || [ -d "$DDN" ]; then
    echo "Source or destination directory already exists. Exiting."
    exit 1
fi

# Create source and destination directories
mkdir -p "$SDN"
mkdir -p "$DDN"

# Source directory to be backed up
source_dir="$(pwd)/$SDN"

# Backup destination directory
backup_dir="$(pwd)/$DDN"

# Timestamp for backup filename
time_stamp=$(date +"%Y%m%d-%H%M%S")

# Create a backup archive
backup_filename="$time_stamp.tar.gz"
backup_filepath="${backup_dir}/${backup_filename}"

echo -e "\nCreating backup of $SDN... \n"

# Create backup archive
tar -czvf "$backup_filepath" "$source_dir" >/dev/null 2>&1

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful! Archive saved to: $backup_filepath"
else
    echo "Backup failed. Check for errors."
fi
