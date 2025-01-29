# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "python-slugify",
# ]
# ///

import sys
from slugify import slugify

print(slugify("".join(sys.argv[1:])), end="")
