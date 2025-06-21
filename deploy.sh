#!/bin/bash

# deploy.sh

echo "🚀 Deploying the app using Docker Compose..."

docker-compose down
docker-compose up --build -d

if [ $? -eq 0 ]; then
    echo "✅ Deployment successful! App is running."
else
    echo "❌ Deployment failed!"
    exit 1

fi


