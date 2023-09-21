#!/bin/bash
#
#
# RUN AS ROOT
#
#

wget 
# Define the path to your Ansible playbook YAML file
playbook_file="/home/kali/playbook.yml"

# Check if the Ansible playbook file exists
if [ ! -f "$playbook_file" ]; then
  echo "Error: Ansible playbook file not found at $playbook_file"
  exit 1
fi

# Run the Ansible playbook
ansible-playbook "$playbook_file"


apt get install feroxbuster
apt get install ffuf
apt get install 
