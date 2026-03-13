#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
STACK_DIR="$SCRIPT_DIR/.firefly-docker"

if [[ ! -f "$STACK_DIR/docker-compose.yml" ]]; then
  echo "No Docker stack found at $STACK_DIR"
  exit 0
fi

cd "$STACK_DIR"
docker compose -f docker-compose.yml down

echo "Firefly III has been stopped."
