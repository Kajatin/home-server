#!/bin/bash

# This script installs docker engine and it's requirements
# Follow the steps on the link below if the script fails
# https://docs.docker.com/engine/install/ubuntu/

# Update repository
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

# Dockers GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify installation
sudo docker run hello-world

# Docker compose
sudo apt-get update
sudo apt-get install docker-compose-plugin

# Verify installation
docker compose version

# Post installation steps
# https://docs.docker.com/engine/install/linux-postinstall/
