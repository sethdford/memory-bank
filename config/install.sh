#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "--- Starting Roo Code Memory Bank Config Setup ---"

# Define files to download (relative to config/ in the repo)
REPO_BASE_URL="https://raw.githubusercontent.com/GreatScottyMac/roo-code-memory-bank/main/config"
FILES_TO_DOWNLOAD=(
    ".roorules-architect"
    ".roorules-ask"
    ".roorules-code"
    ".roorules-debug"
    ".roorules-test"
    ".roomodes"
    "insert-variable.sh"
)

# Check for curl command
if ! command -v curl &> /dev/null; then
    echo "Error: curl is not found in your PATH."
    echo "Please install curl using your distribution's package manager (e.g., sudo apt install curl, sudo yum install curl)."
    exit 1
else
    echo "Found curl executable."
fi

echo "Downloading configuration files..."

# Loop through files and download each one
for FILE in "${FILES_TO_DOWNLOAD[@]}"; do
    echo "  Downloading ${FILE}..."
    # Use -f to fail silently on server errors but return error code
    # Use -L to follow redirects
    # set -e will cause script to exit if curl fails
    curl -L -f -o "${FILE}" "${REPO_BASE_URL}/${FILE}"
    echo "  Successfully downloaded ${FILE}."
done

echo "Running variable injection script..."
chmod +x insert-variable.sh
./insert-variable.sh
# set -e will handle errors from the script
echo "Variable injection complete."

echo "All configuration files downloaded successfully."
echo "--- Roo Code Memory Bank Config Setup Complete ---"

echo "Scheduling self-deletion of $0..."
# Run deletion in a background subshell to allow the main script to exit first
( sleep 1 && rm -f insert-variable.sh && rm -f "$0" ) &

exit 0