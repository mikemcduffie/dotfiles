## du

To sort directories/files by size:

  `du -sk *| sort -rn`

To show cumulative human-readable size:

  `du -sh`

To show cumulative human-readable size and dereference symlinks:

  `du -shL`

Show apparent size instead of disk usage (so sparse files will show
greater than zero):

  `du -h --apparent-size`

To sort directories/files by size (human-readable):

  `du -sh * | sort -rh`

To list the 20 largest files and folders under the current working directory:

  `du -ma | sort -nr | head -n 20`



# Modern Versions

## dust

Dust gives an instant overview of which directories are using disk space.
[More information] (https://github.com/bootandy/dust)

Display information for the current directory:

  `dust`

Display information about one or more directories:

  `dust path/to/directory1 path/to/directory2 ...`

Display 30 directories (defaults to 21):

  `dust --number-of-lines 30`

Display information for the current directory, up to 3 levels deep:

  `dust --depth 3`

Display the biggest directories at the top in descending order:

  `dust --reverse`

Ignore all files and directories with a specific name:

  `dust --ignore-directory file_or_directory_name`

Do not display percent bars and percentages:

  `dust --no-percent-bars`



## ncdu

Disk usage analyzer with an ncurses interface.
[More information] (https://manned.org/ncdu)

Analyze the current working directory:

  `ncdu`

Colorize output:

  `ncdu --color dark|off`

Analyze a given directory:

  `ncdu path/to/directory`

Save results to a file:

  `ncdu -o path/to/file`

Exclude files that match a pattern, argument can be given multiple times
to add more patterns:

  `ncdu --exclude '*.txt'`


