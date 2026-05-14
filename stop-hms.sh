#!/bin/bash

# HMS - Stop All Backend Services

LOG_DIR="$(cd "$(dirname "$0")" && pwd)/logs"
GREEN='\033[0;32m'
NC='\033[0m'

log() { echo -e "${GREEN}[HMS]${NC} $1"; }

for SERVICE in Eureka-Server GatewayMS UserMS ProfileMS Appointment PharmacyMS media; do
  PID_FILE="$LOG_DIR/$SERVICE.pid"
  if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if kill -0 $PID 2>/dev/null; then
      kill $PID
      log "Stopped $SERVICE (PID: $PID)"
    fi
    rm "$PID_FILE"
  fi
done

# Also kill anything on the known ports
for PORT in 8761 9000 8080 9100 9200 9300 9400; do
  PID=$(lsof -ti:$PORT 2>/dev/null)
  if [ -n "$PID" ]; then
    kill -9 $PID 2>/dev/null
    log "Killed process on port $PORT"
  fi
done

log "All HMS services stopped."
