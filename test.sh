#!/bin/bash
set -eu

ip=$1

function log () {
    echo $* >&2
}

function assert_url_statuscode () {
    url=$1
    must_status=$2

    status=$(curl "$url" --connect-to "$ip" -o /dev/null --silent -w "%{http_code}\n")
    if [[ $status == $must_status ]]; then
        return 0
    else
        log $url returned $status, want $must_status >&2
        return 1
    fi
}


log Checking yx.fi
assert_url_statuscode https://yx.fi/1 302
assert_url_statuscode https://yx.fi/ 404
assert_url_statuscode http://yx.fi/ 301

log Checking joneskoo.yx.fi
assert_url_statuscode https://joneskoo.yx.fi/ 200
assert_url_statuscode http://joneskoo.yx.fi/ 301

log OK
