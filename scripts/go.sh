#!/bin/sh
#All the packages we install with go, go here.
#Also we install go here, in case it isn't already.

if ! command -v go
then
	wget -P "$HOME/Downloads/prog" 'https://go.dev/dl/go1.21.5.linux-amd64.tar.gz'
	cd "$HOME/Downloads/prog" || exit 1
	tar -C '/usr/local' -xzf 'go1.21.5.linux-amd64.tar.gz'
	export PATH="$PATH:/usr/local/go/bin"
fi

if ! command -v lf
then
	env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
fi
