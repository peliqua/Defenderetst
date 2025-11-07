#!/bin/bash

MODE=$(mdatp health --output json | jq -r '.passive_mode_enabled')

if [ "$MODE" == "false" ]; then
    echo "Compliant: Defender is in active mode."
    exit 0
else
    echo "Non-compliant: Defender is in passive mode."
    exit 1
fi
