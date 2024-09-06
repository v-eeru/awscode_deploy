#!/bin/bash
if sudo service nginx status | grep -q "active (running)"; then
  echo "Nginx is already running."
else
  echo "Starting Nginx..."
  sudo service nginx start
fi
