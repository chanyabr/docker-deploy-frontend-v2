#!/bin/sh
set -e

# Default values if env vars are not set
VITE_GRAPHQL_URI="${VITE_GRAPHQL_URI:-http://13.218.78.104:8082/graphql}"
VITE_SERVER_URI="${VITE_SERVER_URI:-http://13.218.78.104:8082}"

# Replace placeholders in JS files
find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|_VITE_GRAPHQL_URI_PLACEHOLDER_|${VITE_GRAPHQL_URI}|g" {} +

find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|_VITE_SERVER_URI_PLACEHOLDER_|${VITE_SERVER_URI}|g" {} +

echo "Configured VITE_GRAPHQL_URI=${VITE_GRAPHQL_URI}"
echo "Configured VITE_SERVER_URI=${VITE_SERVER_URI}"

exec nginx -g 'daemon off;'