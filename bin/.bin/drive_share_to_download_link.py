#!/usr/bin/env python3

import sys


share_link = sys.argv[1]

sys.stderr.write(share_link + "\n")

if not share_link.startswith("https://drive.google.com/file/d/"):
    sys.stderr.write("Invalid share link.")
    sys.exit(1)
file_id = share_link.split("/")[5]
download_link = f"https://drive.google.com/uc?id={file_id}&export=download"

sys.stderr.write("\n")
sys.stderr.write("⬇️")

print(download_link, end="")
