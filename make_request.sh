#!/bin/sh

# Check if MAM_ID is set
if [ -z "$MAM_ID" ]; then
  echo "$(date) - Error: MAM_ID environment variable is not set." >&2
  exit 1
fi

# Make the curl request using the MAM_ID cookie
response=$(curl -X GET "https://t.myanonamouse.net/json/dynamicSeedbox.php" \
     -b "mam_id=$MAM_ID" \
     --silent --show-error)

# Check if curl succeeded
if [ $? -eq 0 ]; then
  echo "$(date) - Request succeeded. Response: $response"
else
  echo "$(date) - Request failed." >&2
fi