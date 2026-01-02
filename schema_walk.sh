#!/bin/bash

# Configuration
TARGET="http://172.16.1.24:8080"
OUTPUT_FILE="/tmp/schema_walk_output.txt"
BINARY_DIR="/tmp/schema_artifacts"

# Setup
mkdir -p "$BINARY_DIR"
echo "=== Starting Schema Walk against $TARGET ===" > "$OUTPUT_FILE"
echo "Date: $(date)" >> "$OUTPUT_FILE"
echo "Artifacts will be saved to: $BINARY_DIR" >> "$OUTPUT_FILE"
echo "----------------------------------------" >> "$OUTPUT_FILE"

# Function to log and execute
run_endpoint() {
    METHOD=$1
    ENDPOINT=$2
    IS_BINARY=$3

    echo "" >> "$OUTPUT_FILE"
    echo ">>> [${METHOD}] ${ENDPOINT}" >> "$OUTPUT_FILE"
    
    if [ "$IS_BINARY" == "true" ]; then
        # Handle binary files separately to keep the log clean
        FILENAME=$(echo "${ENDPOINT}" | sed 's/\///g') # Strip slashes for filename
        curl -s -v -X "$METHOD" "${TARGET}${ENDPOINT}" --output "${BINARY_DIR}/${FILENAME}.bin" 2>> "$OUTPUT_FILE"
        echo "   [!] Binary output saved to ${BINARY_DIR}/${FILENAME}.bin" >> "$OUTPUT_FILE"
    else
        # Standard text/json output
        curl -s -v -X "$METHOD" "${TARGET}${ENDPOINT}" >> "$OUTPUT_FILE" 2>&1
    fi
    
    echo "" >> "$OUTPUT_FILE"
    echo "<<< End of ${ENDPOINT}" >> "$OUTPUT_FILE"
}

# --- GET Endpoints ---
# Simple data retrieval
run_endpoint "GET" "/" "false"
run_endpoint "GET" "/get_current_page_url" "false"
run_endpoint "GET" "/logs" "false"
run_endpoint "GET" "/currentTab" "false"
run_endpoint "GET" "/tabs" "false"
run_endpoint "GET" "/get_apc" "false"

# Binary/Sensitive GET Endpoints
run_endpoint "GET" "/browser_screenshot" "true"
run_endpoint "GET" "/get_profile" "true"

# --- POST Endpoints ---
# Note: Many of these will return HTTP 422 (Validation Error) 
# because we are not sending the required JSON body. 
# This confirms the endpoint is active and listening.
run_endpoint "POST" "/navigate" "false"
run_endpoint "POST" "/update_browser_location" "false"
run_endpoint "POST" "/webrtc_sdp_offer" "false"
run_endpoint "POST" "/webrtc_candidate" "false"
run_endpoint "POST" "/newTab" "false"
run_endpoint "POST" "/switchTab" "false"
run_endpoint "POST" "/closeTab" "false"
run_endpoint "POST" "/key_press" "false"
run_endpoint "POST" "/scroll_document" "false"
run_endpoint "POST" "/go_back" "false"
run_endpoint "POST" "/click_at" "false"
run_endpoint "POST" "/hover_at" "false"
run_endpoint "POST" "/type_text_at" "false"
run_endpoint "POST" "/scroll_at" "false"
run_endpoint "POST" "/select_at" "false"
run_endpoint "POST" "/drag" "false"
run_endpoint "POST" "/wait_5_seconds" "false"
run_endpoint "POST" "/load_profile" "false"

echo "----------------------------------------" >> "$OUTPUT_FILE"
echo "Walk complete. Results in $OUTPUT_FILE"
