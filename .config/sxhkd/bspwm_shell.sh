#!/bin/bash
WHEREAMI=$(cat /tmp/whereami)
echo "$WHEREAMI"
st -c "cd ${WHEREAMI}"
