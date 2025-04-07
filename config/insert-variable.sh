#!/usr/bin/env bash
set -e

# Define the target file and placeholder
TARGET_FILE=".roorules-test"
PLACEHOLDER="WORKSPACE_PLACEHOLDER"
WORKSPACE=$(pwd)

echo "--- Injecting Workspace Path into ${TARGET_FILE} ---"

# Check if the target file exists
if [ ! -f "${TARGET_FILE}" ]; then
    echo "Error: ${TARGET_FILE} not found in ${WORKSPACE}"
    exit 1
fi

echo "  Workspace Path: ${WORKSPACE}"
echo "  Target File: ${TARGET_FILE}"

# Determine sed in-place option based on OS
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS specific
    SED_IN_PLACE=(-i "")
else
    # Linux specific
    SED_IN_PLACE=(-i)
fi

# Function to escape strings for sed (especially paths with slashes)
escape_for_sed() {
    echo "$1" | sed 's:[\\/&]:\\&:g;$!s/$/\\/'
}

# Escape the workspace path
ESCAPED_WORKSPACE=$(escape_for_sed "${WORKSPACE}")

# Perform the replacement using sed
# Use a different delimiter for sed (e.g., |) to avoid issues with slashes in paths
sed "${SED_IN_PLACE[@]}" "s|${PLACEHOLDER}|${ESCAPED_WORKSPACE}|g" "${TARGET_FILE}"

if [ $? -ne 0 ]; then
    echo "ERROR: Failed to inject workspace path into ${TARGET_FILE} using sed."
    exit 1
fi

echo "Successfully updated ${TARGET_FILE}."
echo "--- Injection Complete ---"
exit 0