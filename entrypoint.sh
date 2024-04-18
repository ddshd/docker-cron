#!/bin/bash

# Set up the cron job
/etc/docker-cron/setup-cron.sh

/etc/docker-cron/run-scripts.sh

# Keep the container running
tail -f /dev/null
