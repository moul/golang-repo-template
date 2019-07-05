# totp-keychain
:lock: simple TOTP client backed by the keychain (OS X only)

## Usage

```console
$ totp-keychain add moul@github JBSWY3DPEHPK3PXP
2019/06/06 17:59:17 OK

$ totp-keychain add moul@cloudflare HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ
2019/06/06 18:00:32 OK

$ totp-keychain ls
- moul@github
- moul@cloudflare

$ totp-keychain get moul@github
427530

$ totp-keychain get moul@cloudflare
553053

$ sleep 30

$ totp-keychain get moul@github
600322

$ totp-keychain get moul@cloudflare
007099
```

## Install

```console
$ go get -u moul.io/totp-keychain
go: finding moul.io/totp-keychain latest
go: finding github.com/keybase/go-keychain latest
go: finding github.com/boombuler/barcode v1.0.0
go: finding github.com/stretchr/objx v0.2.0
go: downloading moul.io/totp-keychain v0.0.0-20190606153853-716756d5e5e8
go: extracting moul.io/totp-keychain v0.0.0-20190606153853-716756d5e5e8

$ totp-keychain -h
NAME:
   totp-keychain - A new cli application

USAGE:
   totp-keychain [global options] command [command options] [arguments...]

VERSION:
   0.0.0

COMMANDS:
     add
     rm
     ls
     get
     help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h     show help
   --version, -v  print the version
```
