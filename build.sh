#!/bin/bash

USERNAME=kiruba007
APP_NAME=react-app

# Tag and push to dev
docker build -t $USERNAME/${APP_NAME}-dev:latest .
docker push $USERNAME/${APP_NAME}-dev:latest

# Tag and push to prod (optional)
read -p "Push to prod repo? (y/n): " answer
if [ "$answer" == "y" ]; then
  docker tag $USERNAME/${APP_NAME}-dev:latest $USERNAME/${APP_NAME}-prod:latest
  docker push $USERNAME/${APP_NAME}-prod:latest
fi


