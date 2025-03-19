#!/bin/bash

# Install Docker
curl -sSL https://get.docker.com | sh

# Add user to the Docker group
sudo usermod -aG docker home

# Pull and run Portainer
sudo docker pull portainer/portainer-ce:linux-arm
sudo docker run -d -p 9000:9000 --name=portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:linux-arm

# Print success message
echo "Docker and Portainer installation complete. Access Portainer at http://localhost:9000"
