#!/bin/bash

# Start ssh-agent
eval "$(ssh-agent -s)"

# Copy optional ssh keys
mkdir -p ~/.ssh
cp ${SSH_KEYS_FOLDER}/* ~/.ssh/

# Change key permissions
chmod 600 ~/.ssh/*

# Add ssh keys 
ssh-add ~/.ssh/*