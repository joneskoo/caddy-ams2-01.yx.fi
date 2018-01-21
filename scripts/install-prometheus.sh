#!/bin/bash -xeu

PROMETHEUS_VERSION=2.1.0

useradd -m -d /opt/prometheus -c "Prometheus" -s /bin/bash prometheus

curl -fsSL https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz -o /tmp/prometheus.tar.gz

tar -C /opt/prometheus --strip-components=1 -zxf /tmp/prometheus.tar.gz

install --owner prometheus --group prometheus -d /opt/prometheus/data
install -v -g root -m 0644 -o root /tmp/etc/systemd/system/prometheus.service /etc/systemd/system/

install -v -m 0644 /tmp/opt/prometheus/prometheus.yml /opt/prometheus/

systemctl enable prometheus.service
