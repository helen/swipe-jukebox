# Magnetic Swipe Card Jukebox

This repo contains what I'm using to make a Musicbox+Raspberry Pi+Spotify jukebox for my kids work with magnetic swipe cards. There is a very small Bash script that waits for input from a card reader, a list of Spotify URIs (see below for why), and I'll try to explain the steps in this readme.

## Equipment
* Raspberry Pi (any model)
* SD card with MusicBox flashed onto it
* Speakers (USB, 3.5mm, USB soundcard + 3.5mm, whatever you like)
* Magnetic card writer
* USB magnetic card reader (specifically one that emulates keyboard input)
* Magnetic swipe cards

## Steps (to be expanded)
* Set up MusicBox on the Raspberry Pi
* Ensure Spotify is set up and audio is working by running `mpc add spotify:track:7GhIk7Il098yCjg4BQjzvb && mpc play`
* Encode and label cards
* Clone this repo onto the Raspberry Pi
* Run `bash jukebox.sh`
* Swipe card
* Enjoy!

## Why didn't you use X other thing that already exists?

There are a lot of projects I've looked at in the course of planning this that I will link as I continue to flesh out this readme! They helped me understand a lot of things and I would probably not have figured this out entirely on my own. That said, the scripts I found use Python, which is fine, but I wanted something super streamlined that didn't depend on installing other things. Also I barely understand Python and since I'm using magnetic swipe cards instead of RFID chips (mostly due to shipping constraints), I'd have to make modifications anyway.

## Why the list of URIs?

tl;dr: a workaround for a wonky card reader.

I don't live in a country where I can reasonably ship things from Amazon to myself and the USB card reader somebody just brought back from the US for me only seems to read tracks 2 and 3 on cards, confirmed by testing it with real live working cards. Tracks 2 and 3 can only contain numbers, so I figured a list of songs referenced by line number would be the path of least resistance. If I get more time before I just go ahead and acquire another card reader, I'll work on supporting comments so you can identify each line or maybe make it a full-on CSV.

Even if I do end up getting a fully-functional card reader, an advantage of the list of URIs is that I can update the song list on the fly without rewriting the cards so I may not change it, but if I do, it would be to encode the Spotify URI (the one that looks like `spotify:track:blah123`) onto track 1 of each card instead.
