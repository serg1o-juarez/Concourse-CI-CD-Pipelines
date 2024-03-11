# Add repo
sudo rpm -Uvh https://download.postgresql.org/pub/repos/yum/14/redhat/rhel-7.1-x86_64/postgresql14-14.8-1PGDG.rhel7.x86_64.rpm

# Install the database server
sudo yum -y install postgresql14 postgresql14-server postgresql14-contrib

# Initialize the database
sudo /usr/pgsql-14/bin/postgresql14-setup initdb

# Open /var/lib/pgsql/9.6/data/pg_hba.conf
# Change peer and ident under METHOD column to trust and md5, if needed
# See https://postgresql.org/docs/current/auth-pg-hba-conf.html
vi /var/lib/pgsql/14/data/pg_hba.conf

# Start postgres.service
sudo systemctl start postgresql-14
sudo systemctl enable postgresql-14

# Change the posgres user password, if needed
sudo passwd postgres

# Log in and create DB user
sudo su - postgres
createuser concourseci

# Switch to Postgres shell and change password for the user (not needed with peer auth)
psql
ALTER USER concourseci WITH ENCRYPTED password '<choose_password>';

# Create the DB
CREATE DATABASE concourseci OWNER concourseci;
# Exit psql with \q
# Go back to the sudo user with "exit"

# Download Concourse CI and the Fly CLI
sudo wget https://github.com/concourse/concourse/releases/download/v3.4.1/concourse_linux_amd64 -O /usr/bin/concourse
sudo wget https://github.com/concourse/concourse/releases/download/v3.4.1/fly_linux_amd64 -O /usr/bin/fly

# Modify permissions
sudo chmod +x /usr/bin/concourse /usr/bin/fly

# You may have to link the concourse binary under /usr/local/bin
sudo ln -s /usr/local/bin/concourse/bin/concourse /usr/local/bin/concourseci

# Verify versions
concourseci -version
fly -version

# Create a directory and generate keys in it
sudo mkdir /opt/concourse
sudo ssh-keygen -t rsa -b 4096 -m PEM -f /opt/concourse/session_signing_key
sudo ssh-keygen -t rsa -b 4096 -m PEM -f /opt/concourse/tsa_host_key
sudo ssh-keygen -t rsa -b 4096 -m PEM -f /opt/concourse/worker_key

# Copy the worker pub key in authorized_worker_keys file:
sudo cp /opt/concourse/worker_key.pub /opt/concourse/authorized_worker_keys