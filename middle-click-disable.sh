#!/bin/bash
# Disable middle-click paste for valid pointer devices
xinput list | grep -i 'pointer' | while read -r line; do
    # Extract device ID
    device_id=$(echo "$line" | grep -o 'id=[0-9]*' | cut -d= -f2)

    # Apply set-button-map only if the device ID is valid
    if [[ -n "$device_id" ]]; then
        xinput set-button-map "$device_id" 1 0 3 2>/dev/null
    fi
done
