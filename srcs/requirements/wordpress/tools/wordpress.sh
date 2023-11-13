#!/bin/sh

pwd

if [ -d /wordpress ]
then
	echo 'test'
else
   wget https://wordpress.org/latest.zip
   unzip latest.zip
fi

while true; do
	
done
