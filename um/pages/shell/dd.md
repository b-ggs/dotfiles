# dd --
{:data-section="shell"}
{:data-date="February 14, 2019"}
{:data-extra="Um Pages"}

## EXAMPLES

`dd if=/dev/sda1 of=/dev/sdb1 bs=64K conv=noerror,sync status=progress`
: Clone a partition

`dd if=/dev/sda of=/dev/sdb bs=64K conv=noerror,sync status=progress`
: Clone a hard disk

`dd if=/dev/sda conv=sync,noerror bs=64K | gzip -c | split -a3 -b2G - /path/to/backup.img.gz`
: Make disk image and split into FAT32-friendly files
