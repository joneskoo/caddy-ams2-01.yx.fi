#!/bin/bash -xeu

apt-get install -qyy python-pygments
cd /tmp
wget https://github.com/gohugoio/hugo/releases/download/v0.27.1/hugo_0.27.1_Linux-64bit.deb
dpkg -i hugo_0.27.1_Linux-64bit.deb
