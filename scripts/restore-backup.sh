#!/bin/bash -xeu

su -c 'psql shorturl' shorturl < /tmp/backup/shorturl.sql
tar -C / -zxf /tmp/backup/keys.tar.gz
rm -rf /tmp/backup
