#!/bin/bash

echo "Jukebox started!"

while read -ep "Swipe: " INPUT; do
	# Swipe input contains track delimiters, let's extract just the first number and use it
	read -a ID <<< "${INPUT//[^0-9]/ }"
	URI=$( head -"$ID" songs.txt | tail -1 )
	mpc stop && mpc clear && mpc add "$URI" && mpc play
done
