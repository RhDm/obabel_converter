#!/bin/bash

# usage:
# ./obabel_conv.sh SOURCE_FILENAME > TARGET_FILENAME

file=$1
tmp_var=1
while read f
do
	res=$(obabel ---errorlevel 0 -:"$f" -ocan 2>&1)
	echo $res | awk '{print $1;}'
	>&2 echo "$tmp_var. converting $f"
	let "tmp_var+=1"
done < $file

>&2 echo "read lines: " $(wc -l $file)
>&2 echo "wrote lines: " $(($tmp_var-1))
