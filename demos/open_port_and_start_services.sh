# Open port 8080
ufw allow 8080

# Start services
sudo systemctl start concourse-web.service
sudo systemctl start concourse-worker.service

# Enable services
sudo systemctl enable concourse-web.service
sudo systemctl enable concourse-worker.service
