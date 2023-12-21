#!/bin/bash

file1=$1
file2=$2

hash1=$(sha256sum $file1 | awk '{print$1}')
hash2=$(sha256sum $file2 | awk '{print$1}')

if [ $hash1 == $hash2 ]
then
	echo "same"
else
	echo "different"
fi

