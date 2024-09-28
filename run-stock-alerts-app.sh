#!/bin/bash

LOCKFILE="/tmp/stock_alerts.lock"

cleanup() {
    echo "Stopping Node.js and Python processes..."
    kill $NODE_PID
    kill $PYTHON_PID
    rm -f "$LOCKFILE"  # Remove the lock file on cleanup
    exit 0
}

# Trap CTRL+C (SIGINT) to run cleanup
trap cleanup SIGINT

# Check if the script is already running
if [ -f "$LOCKFILE" ]; then
    echo "The script is already running."
    exit 1
else
    touch "$LOCKFILE"  # Create the lock file
fi

# Run the Python app
VENV_DIR="$HOME/Coding/python/projects/stock-alerts/venv"
SCRIPT_PATH="$HOME/Coding/python/projects/stock-alerts/stream.py"
if [ -d "$VENV_DIR" ]; then
  source "$VENV_DIR/bin/activate"
  python "$SCRIPT_PATH" &
  PYTHON_PID=$!
  deactivate
else
  echo "Virtual environment not found at $VENV_DIR"
  rm -f "$LOCKFILE"  # Remove the lock file on error
  exit 1
fi

sleep 5
echo -e "Starting front-end Node.js app\n"
# Run the Node.js app
npm --prefix ~/Coding/js/projects/stock-alerts start &
NODE_PID=$!

# Wait for both the Node.js and Python processes to finish
wait $NODE_PID $PYTHON_PID

# Clean up lock file on normal exit
rm -f "$LOCKFILE"
