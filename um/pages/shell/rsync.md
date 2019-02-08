# rsync -- better transfers™
{:data-section="shell"}
{:data-date="February 03, 2019"}
{:data-extra="Um Pages"}

## EXAMPLES

`rsync -P -h -r --append origin/path target/path`
: Sync files from origin path to target path

`rsync -P -h -r --append --bwlimit 1500 -e ssh username:remote:path/to/sync/ ./`
: Sync files over ssh from remote path to local path and limit download to 1.5 MB/s

## OPTIONS

`-P`
: --partial and --progress

`-h`
: Human readable

`-r`
: Recursive

`--append`
: Append to incomplete file if checksum doesn't match

`--inplace`
: Don't create new copy of file

`--bwlimit [KBPS]`
: Bandwidth limit in kilobytes per second

`-e ssh`
: Transfer over SSH
