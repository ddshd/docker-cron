#!/bin/bash

for script in /scripts/*.sh; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        /bin/bash "$script"
    fi
done
