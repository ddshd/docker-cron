#!/bin/bash

# Set up the cron job
/etc/docker-cron/setup-cron.sh

# Keep the container running
tail -f /dev/null
