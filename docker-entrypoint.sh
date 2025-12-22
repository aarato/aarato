#!/bin/sh
set -e

# Default config YAML URL
DEFAULT_CONFIG_URL="https://raw.githubusercontent.com/aarato/aarato/main/config.yaml"

# Use environment variable or default
CONFIG_URL="${CONFIG_YAML_URL:-$DEFAULT_CONFIG_URL}"

# Generate config.json in the nginx html directory
cat > /usr/share/nginx/html/config.json << EOF
{
  "configYamlUrl": "${CONFIG_URL}"
}
EOF

echo "Generated config.json with configYamlUrl: ${CONFIG_URL}"

# Start nginx
exec nginx -g "daemon off;"
