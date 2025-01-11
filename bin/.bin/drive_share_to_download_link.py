#!/usr/bin/env python3

import sys

def drive_share_to_download_link(share_link: str) -> str:
    """Convert Google Drive share link to download link."""
    if not share_link.startswith("https://drive.google.com/file/d/"):
        return "Invalid share link."
    file_id = share_link.split("/")[5]
    download_link = f"https://drive.google.com/uc?id={file_id}&export=download"
    return download_link

share_link = sys.argv.pop(1)
print(drive_share_to_download_link(share_link))
