#!/bin/bash

HOME_DIR=$HOME
CURRENT_DIR=$(pwd)

if [ -e "$HOME_DIR/.near" ]; then
    echo "The .near file or directory exists in the user's home directory, removing..."
    rm -rf "$HOME_DIR/.near"
else
    echo "The .near file or directory does not exist in the user's home directory."
fi

if [ -e "$HOME_DIR/.near-credentials" ]; then
    echo "The .near-credentials file or directory exists in the user's home directory, removing..."
    rm -rf "$HOME_DIR/.near-credentials"
else
    echo "The .near-credentials file or directory does not exist in the user's home directory."
fi

if [ -e "$CURRENT_DIR/.near" ]; then
    echo "The .near file or directory exists in the current directory, copying to the user's home directory..."
    cp -r "$CURRENT_DIR/.near" "$HOME_DIR"
else
    echo "The .near file or directory does not exist in the current directory, skipping copy."
fi

if [ -e "$CURRENT_DIR/.near-credentials" ]; then
    echo "The .near-credentials file or directory exists in the current directory, copying to the user's home directory..."
    cp -r "$CURRENT_DIR/.near-credentials" "$HOME_DIR"
else
    echo "The .near-credentials file or directory does not exist in the current directory, skipping copy."
fi

# neard run
