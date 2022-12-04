#!/bin/bash

# This script uses crt.sh to find subdomains for a given domain

# Check if the user provided a domain name
if [ -z "$1" ]; then
  # If no domain was provided, print an error message and exit
  echo "Error: No domain provided."
  exit 1
fi

# Parse the domain name from the command-line arguments
domain=$1

# Use crt.sh to find subdomains for the given domain
subdomains=$(curl -s "https://crt.sh/?q=%.$domain&output=json" | jq '.[].name_value' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u)

# Print the subdomains
echo "Subdomains for $domain:"
echo "$subdomains"
