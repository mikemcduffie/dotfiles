https://github.com/sharkdp/fd#readme

Path/file placeholders

| Token | Explanation                                                    |
|:-----:|:-------------------------------------------------------------- |
| {}    | full path of the search result: *documents/images/party.jpg*   |
| {.}   | full path without the file extension: *documents/images/party* |
| {/}   | basename of the search result: *party.jpg*                     |
| {//}  | parent of the discovered path: *documents/images*              |
| {/.}  | basename with the extension removed: *party*                   |

If you do not include a placeholder, `fd` *automatically* adds a {} at the end.                                         



Exclude path

```shell
fd -td 'search term' --exclude Library
fd 'search term' -E /mnt/external-drive
```

or to skip certain file types:

```shell
fd 'search term'-E '*.bak'
```

Permanently ignore with  `~/.fdignore` file

```shell
$ cat ~/.fdignore
/mnt/external-drive
```

Use functions to execute complex operations

```shell
$ jmkv() { 
  mkvpropedit "$1" --edit track:s1 \
    --set flag-default=1 --set flag-forced=1 \
    --set language="eng" \
    --edit track:v1 \
    --set language="jpn" \
    --edit track:a1 \
    --set language="jpn" 
}
$ for f in *.mkv; do jmkv "$f"; done
```

alternately pipe contents to tools with `cat`

```shell
fd org.jdownloader.settings.GraphicalUserInterfaceSettings.json \
  -p /Applications -x cat {} | json_pp | \
  egrep  "special|premium|oboom|bannerenabled|donatestate"
```

process list of files with  `-print0`

```shell
fd -e json -0 | xargs -0 cat {} | json_pp
```

flatten folder structure ignoring top level

```shell
flatten() { fd -tf --min-depth 2 . -x mv -n "{}" ./ }
```

remove Apple dot files / metadata

```shell
fd -H '^\.DS_Store$' -tf -X rm -v
```

remove dot underscore / AppleDouble files

```shell
fd -H '^\._' -tf -X rm -v
```

Show details like file permissions, owners, file sizes etc.: run ls for each result:

```shell
fd … -X ls -lhd --color=always
```

Use -X option with ripgrep `rg` in order to search within a certain class of files, like all C++ source files:

```shell
fd -e cpp -e cxx -e h -e hpp -X rg 'std::cout'
```

Convert all *.jpg files to *.png files:

```shell
fd -e jpg -x convert {} {.}.png
```

Find files with exactly the provided search pattern, use the `-g` or `--glob` option:

```shell
$ fd -g libc.so /usr
/usr/lib32/libc.so
/usr/lib/libc.so
```

List all files, recursively (similiar: `ls -R`)

```shell
$ cd fd/tests
$ fd
testenv
testenv/mod.rs
tests.rs
```

Search a specific directory, <dirpath> given as a second argument to `fd`:

```shell
$ fd passwd /etc
```

Regular expression search

Search for entries that start with x and end with 'rc':

```shell
$ cd /etc
$ fd '^x.*rc$'
X11/xinit/xinitrc
X11/xinit/xserverrc
```

Move folders

```shell
$ fd -td -x  mv -nv {} /path/to/new/parent/{/}
```