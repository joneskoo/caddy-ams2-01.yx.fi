# caddy-ams2-01.yx.fi

Configuration for my web site hosting on digital ocean; image build with packer.

Building requires creating a secrets.json with the following content:

```json
{
  "do_api_token": "... digital ocean API token ...",
  "GITHUB_WEBHOOK_SECRET": "... secret value used in github web hooks ..."
}
```

## Building

First install Go and packer. Then

```sh
$ go get -d github.com/joneskoo/shorturl-go/yxfi-server
$ make
```
