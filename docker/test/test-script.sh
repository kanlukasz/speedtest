#!/bin/sh

## simple script to call sanitycheck on all containers

PORT=8080

apk add w3m

echo sleeping a little to get things setteled...
sleep 15

for db in sqlite pg mysql; do
  for distro in alpine debian; do
	hostname=speedtest-$distro-$db
	echo $hostname
	w3m -dump http://$hostname:$PORT/results/sanitycheck.php|grep -v 'N/A'
  done
done
