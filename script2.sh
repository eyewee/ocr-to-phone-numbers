#!/bin/sh 
cat step3.txt | awk '{print "ccc-" NR "-Client" $s}' |  sed 's/$/\'$'\n''X-GROUP-MEMBERSHIP:My CCC\'$'\n''END:VCARD\'$'\n''/g'  | sed 's~+~\'$'\n''TEL;CELL:+~g' | sed 's[ccc[BEGIN:VCARD\'$'\n''VERSION:2.1\'$'\n''FN:ccc[g'