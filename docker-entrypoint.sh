#!/bin/sh

isCommand() {
  # Retain backwards compatibility with common CI providers
  if [ "$1" = "sh" ]; then
    return 1
  fi

  staticcheck help "$1" > /dev/null 2>&1
}

# check if the first argument passed in looks like a flag
if [ "${1#-}" != "$1" ]; then
  set -- staticcheck "$@"
# check if the first argument passed in is staticcheck
elif [ "$1" = 'staticcheck' ]; then
  set -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- staticcheck "$@"
fi

exec "$@"