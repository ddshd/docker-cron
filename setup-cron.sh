#!/bin/bash

set -e

# Create a new cron file
echo "$CRON_SCHEDULE /bin/bash /etc/docker-cron/run-scripts.sh > /proc/1/fd/1 " > /etc/cron.d/run-scripts

# Apply permissions
chmod 0644 /etc/cron.d/run-scripts

# Apply the cron job
crontab /etc/cron.d/run-scripts

set +e

# Run startup scripts
/etc/docker-cron/run-startup-scripts.sh

# Start the cron service
cron -f