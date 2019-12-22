#!/bin/bash

echo "Jukebox started!"

while read -ep "Swipe: " INPUT; do
	read -a ID <<< "${INPUT//[^0-9]/ }"
	URI=$( head -"$ID" songs.txt | tail -1 )
	mpc stop
	mpc clear
	mpc add "$URI"
	mpc play
done
