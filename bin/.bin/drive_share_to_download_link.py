#!/usr/bin/env python3

import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument(
    "share_link",
    help="Google Drive share link (https://drive.google.com/file/d/...)",
)
args = parser.parse_args()

share_link = args.share_link

sys.stderr.write(f"Received share link: {share_link}\n")

if not share_link.startswith("https://drive.google.com/file/d/"):
    sys.stderr.write("Invalid share link.\n")
    sys.exit(1)
file_id = share_link.split("/")[5]
download_link = f"https://drive.google.com/uc?id={file_id}&export=download"

print(download_link, end="")
