#!/bin/bash

# Create a new cron file
echo "$CRON_SCHEDULE /bin/bash /etc/docker-cron/run-scripts.sh" > /etc/cron.d/run-scripts

# Apply permissions
chmod 0644 /etc/cron.d/run-scripts

# Apply the cron job
crontab /etc/cron.d/run-scripts

# Start the cron service
cron -f
