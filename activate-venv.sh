#!/bin/bash

# Function to deactivate the existing virtual environment
deactivate_venv() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    fi
}

# Function to find the virtual environment and return its activate path
find_venv() {
    local current_dir=$(pwd)
    for venv in "$current_dir"/*/bin/activate; do
        if [[ -f "$venv" ]]; then
            echo "$venv"  # Return the full path of the activate script
            return 0
        fi
    done
    echo "No virtual environment found." >&2
    return 1
}

deactivate_venv
find_venv
