#!/bin/bash

for script in /startup/*.sh; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        echo "[Running: $script]"
        /bin/bash "$script"
    fi
done
