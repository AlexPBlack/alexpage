#!/bin/bash

# Connect to Redis server
redis-cli -h localhost -p 6379 -a sky <<EOF
# Set the default expiration time (2 hours = 7200 seconds)
CONFIG SET default-ttl 7200

# Alternatively, you can set a default policy for keys that don't have an explicit expiration
# CONFIG SET expire-after-write 7200

# If you want to set an initial key-value pair with the default expiration
SET my_initial_key my_value EX 7200

# Exit the Redis client
quit
EOF
