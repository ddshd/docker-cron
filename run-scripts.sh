#!/bin/bash

for script in /scripts/*.sh; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        echo "[Running: $script]"
        /bin/bash "$script"
    fi
done
