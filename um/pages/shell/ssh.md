# ssh -- OpenSSH client
{:data-section="shell"}
{:data-date="February 03, 2019"}
{:data-extra="Um Pages"}

## EXAMPLES

`ssh -D 1080 -CT user@remote`
: SOCKS proxy on localhost:1080

`ssh -L 3000:localhost:3000 -NT user@remote`
: Forward remote:3000 to localhost:3000

`ssh -o "UserKnownHostsFile /dev/null"`
: Ignore known_hosts

## OPTIONS

`-D`
: Bind port for port forwarding

`-L [bind_address:]port:host:hostport`
: Forward specific ports

`-C`
: Compress data

`-T`
: Disable tty

`-i /path/to/keyfile`
: Specify private key

`-o option`
: Override config file

## KEYBINDS

`~.<ENTER>`
: Force exit out of session
