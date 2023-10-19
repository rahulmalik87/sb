#!/bin/bash

# SSH to the remote server
ssh -t rahulmalik@43.205.108.66 "bash -c '
# Within the SSH session on the remote server:

# Check for an existing screen session
if screen -ls | grep -q mysession; then
   # If the screen session exists, attach to it
   screen -x mysession
else
   # If the screen session doesn't exist, create and attach to it
   screen -dmS mysession
   screen -S mysession
fi
source ~/bs

# You can add more commands to run within the screen session if needed
'"
