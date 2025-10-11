#!/bin/bash

DEVICE=$1 # SINK or SOURCE

if [[ $DEVICE == "SINK" ]]; then
    PLATFORM='platform::mute'
else
    PLATFORM='platform::micmute'
fi

if [[ $(wpctl get-volume "@DEFAULT_AUDIO_${DEVICE}@") = *"[MUTED]"* ]]; then
    brightnessctl -d $PLATFORM set 1
else 
    brightnessctl -d $PLATFORM set 0
fi
