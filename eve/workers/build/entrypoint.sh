#!/bin/bash
set -e -o pipefail

if [ -z ${HOST+x} ]; then
# if host isn't known then check outbound IP when contacting google
  export LIBPROCESS_IP=$(ip route get 8.8.8.8 | head -1 | cut -d' ' -f8)
else
  export LIBPROCESS_IP=$HOST
fi

echo "Starting Livy Server"
# start Livy
/apps/livy/bin/livy-server $@
