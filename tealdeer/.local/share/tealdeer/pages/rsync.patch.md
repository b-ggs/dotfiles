- Sync files, showing progress (`-P` = `--partial --progress`), human-readable (`-h`), recursive (`-r`), appending to incomplete files:

`rsync -Phr --append origin/path target/path`

- Sync files over SSH (`-e ssh`) from a remote path, limiting bandwidth to 1.5 MB/s (`--bwlimit` is in KB/s):

`rsync -Phr --append --bwlimit 1500 -e ssh username@remote:path/to/sync/ ./`

- Update files in place instead of creating new copies:

`rsync -Phr --inplace origin/path target/path`
