#!/bin/bash
domain=http://www.boopsie.com
if (curl -Is $domain) | head -n 1 | grep "200 OK"
then
	echo "$domain is up!"
else
	echo "Uh-oh! something's wrong. You should probably check on that..."
fi
