#!/usr/bin/env python3

import sys
import urllib.parse
import argparse

parser = argparse.ArgumentParser()
parser.add_argument(
    "language",
    help="Language code, e.g. `lt`",
)
parser.add_argument(
    "text",
    nargs=argparse.REMAINDER,
)
args = parser.parse_args()

language = args.language
text = " ".join(args.text)

sys.stderr.write(f"Language: {language}\n")
sys.stderr.write(f"Text: {text}\n")

url = "https://www.deepl.com/en/translator#"
url += f"{language}/en/"
url += urllib.parse.quote(text)

print(url, end="")
