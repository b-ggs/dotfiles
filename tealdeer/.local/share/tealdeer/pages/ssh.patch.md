- Open a SOCKS proxy on localhost:1080 (`-D` bind port, `-C` compress, `-T` no tty):

`ssh -D 1080 -CT user@remote`

- Forward remote:3000 to localhost:3000 (`-L [bind_address:]port:host:hostport`, `-N` no command):

`ssh -L 3000:localhost:3000 -NT user@remote`

- Ignore `known_hosts` (`-o` overrides a config option):

`ssh -o "UserKnownHostsFile /dev/null" user@remote`

- Jump through `host1` to reach `host2`:

`ssh -J host1 host2`

- Connect with a specific private key:

`ssh -i /path/to/keyfile user@remote`

- Force-exit a hung session (type at the start of a line):

`<Enter>~.`
