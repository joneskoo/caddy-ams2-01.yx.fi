#!/bin/bash -xeu

# Install caddy
curl -fsSL https://getcaddy.com | bash -s personal http.git,http.hugo,http.prometheus

apt-get install -qyy git

# Install caddy configs
install -d -v -g www-data -m 0770 -o root /etc/ssl/caddy
install -d -v -g www-data -m 0750 -o root /etc/caddy /etc/caddy/sites
install -v -g www-data -m 0640 -o root /tmp/etc/caddy/Caddyfile /etc/caddy/
install -v -g www-data -m 0640 -o root /tmp/etc/caddy/sites/* /etc/caddy/sites/

# Install caddy service
install -v -g root -m 0644 -o root /tmp/etc/systemd/system/caddy.service /etc/systemd/system/

# Inject a randomly generated token for github webhook
sed -i '/\[Service\]/a Environment=GITHUB_WEBHOOK_SECRET='$GITHUB_WEBHOOK_SECRET /etc/systemd/system/caddy.service

# Install web site content
install -d -v -g www-data -m 0770 -o www-data /var/www /var/www/joneskoo.yx.fi /var/www/seemslegit.website

systemctl enable caddy.service
