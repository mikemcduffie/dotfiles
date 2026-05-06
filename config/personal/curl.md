- To download a file:

`curl <url>`


- To download and rename a file:

`curl <url> -o <outfile>`


- To download multiple files :


`curl -O <url> -O <url>`


- To download all sequentially numbered files (1-24):

`curl http://example.com/pic[1-24].jpg`


- To download a file and pass HTTP authentication:

`curl -u <username>:<password> <url>`


- To download a file with a proxy:

`curl -x <proxy-host>:<port> <url>`


- To download a file over FTP:

`curl -u <username>:<password> -O ftp://example.com/pub/file.zip`


- To get an FTP directory listing:

`curl ftp://username:password@example.com`


- To resume a previously failed download:

`curl -C - -o <partial-file> <url>`


- To fetch only the HTTP headers from a response:

`curl -I <url>`


- To fetch your external IP and network info as JSON:

`curl http://ifconfig.me/all.json`


- To limit the rate of a download:

`curl --limit-rate 1000B -O <outfile>`


- To get your external/global IP (WAN):

`curl httpbin.org/ip `


- To get only the HTTP status code:

`curl -o /dev/null -w '%{http_code}\n' -s -I URL`


- Write output to a local file named like the remote file we get. 
  (Only the file part of the remote file is used, the path is cut off.)

`curl -O, --remote-name`


- The remote file name to use for saving is extracted from the given
  URL, nothing else.

- Consequentially, the file will be saved in the current working
  directory. If you want the file saved in a different directory,
  make sure you change current working directory before you invoke
  curl with the `-O`, `--remote-name` flag!

- There is no URL decoding done on the file name. If it has %20 or
  other URL encoded parts of the name, they will end up as-is as
  file name.
