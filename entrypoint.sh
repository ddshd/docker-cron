#!/bin/bash

# Run start up jobs
for script in /startup/*.sh; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        echo "[Running Startup: $script]"
        /bin/bash "$script"
    fi
done

python3 /etc/docker-cron/runner.py