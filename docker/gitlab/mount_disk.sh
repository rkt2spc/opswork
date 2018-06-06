#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

# Required environment variables
REQUIRED_ENV=(
  "DEVICE_ID"
  "MNT_DIR"
)

# Check missing environment variables
missing_variables=false
for env in "${REQUIRED_ENV[@]}"; do
  if [[ -z "${!env}" ]]; then
    echo "Missing required environment variable $env"
    missing_variables=true
  fi
done

# Exit if there are missing variables
if [ $missing_variables = "true" ];
then
  echo "Please specify ${RED}DEVICE_ID${NOCOLOR} by checking with ${RED}'sudo lsblk'${NOCOLOR} and pick a custom ${RED}/mnt/disks/MNT_DIR${NOCOLOR} of your choice"
  exit 1;
fi

# Print information
echo
read -p "$(echo -e "The disk ${RED}${DEVICE_ID}${NOCOLOR} will be mounted at ${RED}/mnt/disks/${MNT_DIR}${NOCOLOR}. Proceed? (Y/n)")" choice
case "$choice" in 
  n|N|no)
    echo "Cancelled..."
    exit
    ;;
esac

# Format the disk
echo
read -p "$(echo -e "Do you want to format ${RED}${DEVICE_ID}${NOCOLOR} ?. This will erase all of it's content. (y/N)")" choice
case "$choice" in 
  y|Y|yes)
    echo "Formatting ${DEVICE_ID}..."
    sudo mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/${DEVICE_ID}
    ;;
  *)
    echo "Skipping..."
    ;;
esac

# Creating mount dir
echo
echo -e "Creating ${RED}/mnt/disks/${MNT_DIR}${NOCOLOR}"
mkdir -p /mnt/disks/${MNT_DIR}

# Mount the disk
echo
echo -e "Mounting ${RED}${DEVICE_ID}${NOCOLOR} at ${RED}/mnt/disks/${MNT_DIR}${NOCOLOR}"
mount -o discard,defaults /dev/${DEVICE_ID} /mnt/disks/${MNT_DIR}

# Modify permissions of newly mounted disk
echo
echo -e "Modifying permissions of newly mounted disk"
chmod a+w /mnt/disks/${MNT_DIR}
