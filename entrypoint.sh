#!/bin/bash

# Set up the cron job
/etc/docker-cron/setup-cron.sh

/bin/bash /etc/docker-cron/run-scripts.sh > /proc/1/fd/1

# Keep the container running
tail -f /dev/null
