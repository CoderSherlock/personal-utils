#!/bin/bash

# This script decreases the audio volume by a specified percentage.

usage() {
    echo "Usage: $0 <percentage>"
    echo "Example: $0 5"
    exit 1
}

if [ $# -ne 1 ]; then
    usage
fi

amixer sset Master "$1%-"
