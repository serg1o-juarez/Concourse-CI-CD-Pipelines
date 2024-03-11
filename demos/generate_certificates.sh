mkdir -p /etc/concourse
sudo ssh-keygen -t rsa -q -N '' -f /etc/concourse/tsa_host_key
sudo ssh-keygen -t rsa -q -N '' -f /etc/concourse/worker_key
sudo ssh-keygen -t rsa -q -N '' -f /etc/concourse/session_signing_key

# Make a copy of the worker key, in case we need to distribute it
cp /etc/concourse/worker_key.pub /etc/concourse/authorized_worker_keys
