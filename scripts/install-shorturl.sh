#!/bin/bash -eux

apt-get install -qyy postgresql

# Create service user shorturl
useradd -m -d /opt/shorturl -c "Short URL service" -s /bin/bash shorturl

su -c 'createuser shorturl' postgres
su -c 'createdb -O shorturl shorturl' postgres

# Create directories
install -d -v -g shorturl -m 0700 -o shorturl /opt/shorturl /opt/shorturl/bin /opt/shorturl/.ssh

# Allow backups
install -v -g shorturl -m 0600 -o shorturl /tmp/opt/shorturl/.ssh/authorized_keys /opt/shorturl/.ssh/

# Install server binary
install -v -g shorturl -m 0700 -o shorturl /tmp/opt/shorturl/bin/yxfi-server /opt/shorturl/bin/

# Create service
install -v -g root -m 0644 -o root /tmp/etc/systemd/system/yxfi-server.service /etc/systemd/system/

systemctl enable yxfi-server.service
