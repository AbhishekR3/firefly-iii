#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
STACK_DIR="$SCRIPT_DIR/.firefly-docker"

ensure_docker_ready() {
  if docker info >/dev/null 2>&1; then
    return 0
  fi

  echo "Docker is not running. Starting Docker Desktop..."
  open -a Docker

  for _ in {1..90}; do
    if docker info >/dev/null 2>&1; then
      echo "Docker is ready."
      return 0
    fi
    sleep 2
  done

  echo "Docker did not become ready in time. Please open Docker Desktop and try again."
  return 1
}

generate_random() {
  local length="$1"
  python3 - "$length" <<'PY'
import secrets
import string
import sys

length = int(sys.argv[1])
alphabet = string.ascii_letters + string.digits
print(''.join(secrets.choice(alphabet) for _ in range(length)))
PY
}

mkdir -p "$STACK_DIR"

ensure_docker_ready

if [[ ! -f "$STACK_DIR/docker-compose.yml" ]]; then
  curl -fsSL "https://raw.githubusercontent.com/firefly-iii/docker/main/docker-compose.yml" -o "$STACK_DIR/docker-compose.yml"
fi

if [[ ! -f "$STACK_DIR/.env" ]]; then
  curl -fsSL "https://raw.githubusercontent.com/firefly-iii/firefly-iii/main/.env.example" -o "$STACK_DIR/.env"
fi

if [[ ! -f "$STACK_DIR/.db.env" ]]; then
  curl -fsSL "https://raw.githubusercontent.com/firefly-iii/docker/main/database.env" -o "$STACK_DIR/.db.env"
fi

if grep -q '^APP_KEY=SomeRandomStringOf32CharsExactly$' "$STACK_DIR/.env"; then
  APP_KEY="$(generate_random 32)"
  sed -i '' "s|^APP_KEY=.*|APP_KEY=$APP_KEY|" "$STACK_DIR/.env"
fi

if grep -q '^STATIC_CRON_TOKEN=PLEASE_REPLACE_WITH_32_CHAR_CODE$' "$STACK_DIR/.env"; then
  CRON_TOKEN="$(generate_random 32)"
  sed -i '' "s|^STATIC_CRON_TOKEN=.*|STATIC_CRON_TOKEN=$CRON_TOKEN|" "$STACK_DIR/.env"
fi

if grep -q '^APP_URL=' "$STACK_DIR/.env"; then
  sed -i '' 's|^APP_URL=.*|APP_URL=http://localhost|' "$STACK_DIR/.env"
fi

DB_PASSWORD=""
if grep -q '^MYSQL_PASSWORD=' "$STACK_DIR/.db.env"; then
  DB_PASSWORD="$(grep '^MYSQL_PASSWORD=' "$STACK_DIR/.db.env" | head -n 1 | cut -d '=' -f2-)"
fi

if [[ -z "$DB_PASSWORD" || "$DB_PASSWORD" == "secret_firefly_password" ]]; then
  DB_PASSWORD="$(generate_random 24)"
  if grep -q '^MYSQL_PASSWORD=' "$STACK_DIR/.db.env"; then
    sed -i '' "s|^MYSQL_PASSWORD=.*|MYSQL_PASSWORD=$DB_PASSWORD|" "$STACK_DIR/.db.env"
  else
    printf '\nMYSQL_PASSWORD=%s\n' "$DB_PASSWORD" >> "$STACK_DIR/.db.env"
  fi
fi

if grep -q '^DB_PASSWORD=' "$STACK_DIR/.env"; then
  sed -i '' "s|^DB_PASSWORD=.*|DB_PASSWORD=$DB_PASSWORD|" "$STACK_DIR/.env"
else
  printf '\nDB_PASSWORD=%s\n' "$DB_PASSWORD" >> "$STACK_DIR/.env"
fi

cd "$STACK_DIR"
docker compose -f docker-compose.yml up -d --pull=always

open "http://localhost"

echo ""
echo "Firefly III is starting."
echo "Open:     http://localhost"
echo "Importer: http://localhost:8081"
echo "Logs:     docker compose -f $STACK_DIR/docker-compose.yml logs -f"
