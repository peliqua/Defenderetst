#!/bin/bash

CONFIG_FILE="/etc/opt/microsoft/mdatp/managed/mdatp_managed.json"

# Check if the file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Defender config file not found: $CONFIG_FILE"
    exit 1
fi

# Check if passiveMode is set to true (no space between colon and value)
if grep -q '"passiveMode":true' "$CONFIG_FILE"; then
    echo "Defender is in passive mode. Switching to active mode..."

    # Use sed to replace true with false
    sed -i 's/"passiveMode":true/"passiveMode":false/' "$CONFIG_FILE"

    echo "Defender mode updated to active."
else
    echo "Defender is already in active mode."
