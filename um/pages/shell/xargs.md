# xargs --
{:data-section="shell"}
{:data-date="February 25, 2019"}
{:data-extra="Um Pages"}

WIP

## SYNOPSIS


## DESCRIPTION


## TLDR entry

xargs

Execute a command with piped arguments coming from another command, a file, etc.
The input is treated as a single block of text and split into separate arguments on spaces, tabs, newlines and end-of-file.

- Main usage pattern:
    arguments_source | xargs command

- Delete all files with a `.backup` extension. `-print0` on find uses a null character to split the files, and `-0` changes the delimiter to the null character (useful if there's whitespace in filenames):
    find . -name '*.backup' -print0 | xargs -0 rm -v

- Execute the command once for each input line, replacing any occurrences of the placeholder (here marked as `_`) with the input line:
    arguments_source | xargs -I _ command _ optional_extra_arguments
