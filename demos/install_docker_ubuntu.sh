# Update packages
sudo apt-get update

# Install PostgreSQL and related packages
sudo apt install postgresql postgresql-contrib -y

# cd to the postgres user home directory, to avoid some harmless error messages
cd /var/lib/postgresql

# Verify the DB is up and running
systemctl status postgresql.service

# Start DB service, if necessary
# sudo systemctl start postgresql.service

# Give user postgres a password
sudo passwd postgres

# Create a DB user for Concourse CI
sudo -u postgres createuser --owner=concourseci atc

# Along with a DB - atc (Air Traffic Controller)
sudo -u postgres createdb --owner=concourseci atc

# Log into DB server to verify everything is in place
sudo -u postgres psql -U postgres -W

### Helper commands
# -e echoes the server response - otherwise we don't know what happened
# Full list here: https://phoenixnap.com/kb/delete-postgres-user
# sudo -u postgres dropuser <user> -e

### Alernative commands
# sudo su - postgres
# dropuser <name> -e

# Install dependencies
sudo apt-get install -y curl gnupg2 software-properties-common

# Download Concourse CI and Fly CLI, and extract the packages
curl -LO "https://github.com/concourse/concourse/releases/download/v7.9.1/concourse-7.9.1-linux-amd64.tgz"
tar -xzf concourse*.tgz
curl -LO https://github.com/concourse/concourse/releases/download/v7.9.1/fly-7.9.1-linux-amd64.tgz
tar -xzf fly*.tgz

# Make them executable and move them in the standard location /usr/local/bin
chmod +x concourse* fly*
mv concourse* /usr/local/bin/
mv fly* /usr/local/bin/

# Quick sanity check
concourse --version
fly --version
