#!/bin/bash

# HMS - One-Click Backend Startup Script
# Starts all services in the correct order

BASE_DIR="$(cd "$(dirname "$0")" && pwd)/Backend"
LOG_DIR="$(cd "$(dirname "$0")" && pwd)/logs"

mkdir -p "$LOG_DIR"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log() { echo -e "${GREEN}[HMS]${NC} $1"; }
warn() { echo -e "${YELLOW}[HMS]${NC} $1"; }
error() { echo -e "${RED}[HMS]${NC} $1"; }

# Ensure PostgreSQL is running
log "Checking PostgreSQL..."
if ! /opt/homebrew/opt/postgresql@17/bin/pg_isready -q 2>/dev/null; then
  warn "PostgreSQL not running. Starting..."
  brew services start postgresql@17
  sleep 3
fi
log "PostgreSQL is ready."

# Kill any existing HMS processes on these ports
for PORT in 8761 9000 8080 9100 9200 9300 9400; do
  PID=$(lsof -ti:$PORT 2>/dev/null)
  if [ -n "$PID" ]; then
    warn "Killing existing process on port $PORT (PID: $PID)"
    kill -9 $PID 2>/dev/null
  fi
done

start_service() {
  local NAME=$1
  local DIR=$2
  local PORT=$3

  log "Starting $NAME on port $PORT..."
  cd "$DIR"
  ./mvnw spring-boot:run > "$LOG_DIR/$NAME.log" 2>&1 &
  echo $! > "$LOG_DIR/$NAME.pid"
  cd - > /dev/null
}

wait_for_port() {
  local NAME=$1
  local PORT=$2
  local MAX_WAIT=90
  local COUNT=0

  printf "Waiting for $NAME (port $PORT)"
  while ! nc -z localhost $PORT 2>/dev/null; do
    sleep 2
    COUNT=$((COUNT+2))
    printf "."
    if [ $COUNT -ge $MAX_WAIT ]; then
      echo ""
      error "$NAME failed to start within ${MAX_WAIT}s. Check logs/$NAME.log"
      exit 1
    fi
  done
  echo ""
  log "$NAME is UP on port $PORT"
}

# --- Start in order ---

# 1. Eureka Server (must be first)
start_service "Eureka-Server" "$BASE_DIR/Eureka-Server" 8761
wait_for_port "Eureka-Server" 8761

# 2. Gateway (needs Eureka)
start_service "GatewayMS" "$BASE_DIR/GatewayMS" 9000
wait_for_port "GatewayMS" 9000

# 3. All microservices (parallel)
start_service "UserMS"      "$BASE_DIR/UserMS"      8080
start_service "ProfileMS"   "$BASE_DIR/ProfileMS"   9100
start_service "Appointment" "$BASE_DIR/Appointment" 9200
start_service "PharmacyMS"  "$BASE_DIR/PharmacyMS"  9300
start_service "media"       "$BASE_DIR/media"       9400

# Wait for all microservices
wait_for_port "UserMS"      8080
wait_for_port "ProfileMS"   9100
wait_for_port "Appointment" 9200
wait_for_port "PharmacyMS"  9300
wait_for_port "media"       9400

echo ""
log "=============================================="
log "  All HMS backend services are running!"
log "=============================================="
echo ""
echo "  Eureka Dashboard : http://localhost:8761"
echo "  API Gateway      : http://localhost:9000"
echo "  UserMS           : http://localhost:8080"
echo "  ProfileMS        : http://localhost:9100"
echo "  AppointmentMS    : http://localhost:9200"
echo "  PharmacyMS       : http://localhost:9300"
echo "  MediaMS          : http://localhost:9400"
echo ""
log "Logs are in: $LOG_DIR/"
log "To stop all services, run: ./stop-hms.sh"
