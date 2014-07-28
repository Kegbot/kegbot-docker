#!/bin/bash -ex

# Run script for kegbot appserver.

die() {
  echo "Error: $@"
  exit 1
}

### Main routines

setup_env() {
  # Copy host information from docker links, if present.
  if [ -n "${KEGBOT_SERVER_PORT_8000_TCP_ADDR}" ]; then
    export UPSTREAM_HOST="${KEGBOT_SERVER_PORT_8000_TCP_ADDR}"
    export UPSTREAM_PORT="${KEGBOT_SERVER_PORT_8000_TCP_PORT}"
  fi

  # Verify mandatory variables.
  if [ -z "${UPSTREAM_HOST}" ]; then
    die "Must set UPSTREAM_HOST or KEGBOT_SERVER_PORT_8000_TCP_{ADDR,PORT}"
  fi
  if [ -z "${UPSTREAM_PORT}" ]; then
    die "Must set UPSTREAM_PORT or KEGBOT_SERVER_PORT_8000_TCP_{ADDR,PORT}"
  fi
}

copy_config() {
  rm -f /etc/nginx/sites-enabled/default
  cp /etc/nginx/sites-available/kegbot.tmpl /etc/nginx/sites-enabled/default
  sed -i "s/UPSTREAM_HOST/${UPSTREAM_HOST}/" /etc/nginx/sites-enabled/default
  sed -i "s/UPSTREAM_PORT/${UPSTREAM_PORT}/" /etc/nginx/sites-enabled/default
}

run_all() {
  env |grep KEGBOT
  setup_env
  copy_config
  nginx
}

run_all