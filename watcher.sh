#!/bin/bash

# Define Variables
NAMESPACE="sre"
DEPLOYMENT_NAME="swype-app"
MAX_RESTARTS=3

# Start a Loop
while true; do
    # Check Pod Restarts
    restarts=$( kubectl get pods -n sre -l app=swype-app | tail -1 | awk '{ print $4 }')

    # Display Restart Count
    echo "Restart count: $restarts"

    # Check Restart Limit
    if [ $restarts -gt $MAX_RESTARTS ]; then
        # Scale Down if Necessary
        echo "Scaling down deployment $DEPLOYMENT_NAME in namespace $NAMESPACE..."
        kubectl scale deployment $DEPLOYMENT_NAME --replicas=0 -n $NAMESPACE
        break
    fi

    # Pause
    sleep 60
done