- Print the contents of a textclipping file

```bash
DeRez -only utf8 "${1?Missing argument}" | \
  sed -e '1d' -e '$d' | \
  cut -d \" -f 2 | \
  xxd -p -r`
```