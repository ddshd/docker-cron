#!/bin/bash

for script in /startup/*.sh; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        /bin/bash "$script"
    fi
done
