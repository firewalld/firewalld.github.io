#!/bin/bash

for file in *.html; do
    line=$(cat "$file" | head -c 3)
    name=${file%%.html}
    if [ "$line" != "---" ]; then
	echo "fixing $file"
	sed -i "1s/^/---\nlayout: page\ntitle: $name\n---\n\n/" $file 
    fi
done
