- Clone a partition:

`dd if=/dev/sda1 of=/dev/sdb1 bs=64K conv=noerror,sync status=progress`

- Clone a hard disk:

`dd if=/dev/sda of=/dev/sdb bs=64K conv=noerror,sync status=progress`

- Make a disk image and compress it with gzip:

`dd if=/dev/sda conv=sync,noerror bs=64K | gzip -c > /path/to/backup.img.gz`

- Make a disk image and split it into FAT32-friendly files:

`dd if=/dev/sda conv=sync,noerror bs=64K | gzip -c | split -a3 -b2G - /path/to/backup.img.gz`

- Restore a gzipped disk image:

`gunzip -c /path/to/backup.img.gz | dd of=/dev/sda`

- Restore a split gzipped disk image:

`cat /path/to/backup.img.gz* | gunzip -c | dd of=/dev/sda`
