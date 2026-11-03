#!/bin/sh

set -eu

echo "==== Running Test ===="

OUTPUT=$(./app.sh)

echo "Application output:"
echo "$OUTPUT"

echo "$OUTPUT" | grep -q "Hello ACL"

echo "==== Test Pass===="


