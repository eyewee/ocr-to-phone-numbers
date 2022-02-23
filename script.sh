#!/bin/sh 
cat raw_output.txt | grep -oh '+.............*' | grep "^+[0-9 -:]*[:.]\?" | sed  "s/[0-9]\{2\}\.[0-9]\{2\}\.[0-9]\{4\}//g" | grep -o "+[0-9 -]*" | sed 's/ //g; s/-//g' | sort -u