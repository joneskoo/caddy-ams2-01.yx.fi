#!/bin/bash -eux

apt-get update
apt-get -qyy upgrade
apt-get -qyy dist-upgrade
apt-get -qyy autoremove