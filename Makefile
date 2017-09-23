.PHONY: packer
packer: opt/shorturl/bin/yxfi-server
	packer build -on-error=ask -var-file=secrets.json caddy-ams2-01.yx.fi.json

clean:
	rm -f opt/shorturl/bin/yxfi-server

opt/shorturl/bin/yxfi-server:
	mkdir -p opt/shorturl/bin
	GOOS=linux go build -o $@ github.com/joneskoo/shorturl-go/yxfi-server
