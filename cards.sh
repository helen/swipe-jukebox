#!/bin/bash

for i in $(seq -f "%03g" 1 250)
do
	echo -e "2019.12.22    21:03:23\n%$i?\n;$i?\n+$i?\n" | tee -a cards.txt
done
