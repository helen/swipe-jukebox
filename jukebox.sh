#!/bin/bash

# Update songs list
curl https://raw.githubusercontent.com/helen/swipe-jukebox/master/songs.txt > songs.txt

echo "Jukebox started!"

while read -ep "Swipe: " INPUT; do
	# Swipe input contains track delimiters, let's extract just the first number and use it
	read -a ID <<< "${INPUT//[^0-9]/ }"

	if [[ -z "$ID" ]]; then
		continue
	fi

	ID=$( echo $ID | sed 's/^0*//' )

	if [[ "$ID" -eq "999" ]]; then
		mpc toggle
		continue
	fi

	URI=$( sed "${ID}q;d" songs.txt )

	if [[ -z "$URI" ]]; then
		continue
	fi

	mpc stop && mpc clear && mpc add "$URI" && mpc play
done
