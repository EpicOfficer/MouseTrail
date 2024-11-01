#!/bin/sh

# Check if MAM_ID is set
if [ -z "$MAM_ID" ]; then
  echo "Error: MAM_ID environment variable is not set."
  exit 1
fi

# Make the curl request using the MAM_ID cookie
curl -X GET "https://t.myanonamouse.net/json/dynamicSeedbox.php" \
     -b "mam-id=$MAM_ID" \
     --silent --show-error || echo "Request failed."