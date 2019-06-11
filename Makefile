.PHONY: packer
packer: #opt/shorturl/bin/yxfi-server backup
	packer build -on-error=ask -var-file=secrets.json caddy.json

clean:
	rm -f opt/shorturl/bin/yxfi-server

opt/shorturl/bin/yxfi-server:
	mkdir -p opt/shorturl/bin
	go get -d github.com/joneskoo/shorturl-go/yxfi-server
	GOOS=linux go build -o $@ github.com/joneskoo/shorturl-go/yxfi-server

.PHONY: backup
backup: backup/shorturl.sql backup/keys.tar.gz

.PHONY: backup/shorturl.sql
backup/shorturl.sql:
	gcloud compute --project=molten-calling-195820 ssh caddy-01 --command="sudo -u shorturl pg_dump shorturl" > $@

.PHONY: backup/keys.tar.gz
backup/keys.tar.gz:
	gcloud compute --project=molten-calling-195820 ssh caddy-01 --command="sudo tar zc /etc/ssl/caddy /etc/ssh/ssh_host*" > $@
