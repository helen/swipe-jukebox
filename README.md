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
* Run `curl https://raw.githubusercontent.com/helen/swipe-jukebox/master/jukebox.sh > jukebox.sh`
* [Set root to auto-login](https://www.opentechguides.com/how-to/article/raspberry-pi/5/raspberry-pi-auto-start.html) (unless you want to have to log in every time it reboots)
* [Set `/root/jukebox.sh` to run after login](https://www.opentechguides.com/how-to/article/raspberry-pi/5/raspberry-pi-auto-start.html) (unless, again, you want to do this manually every time)
* Run `bash jukebox.sh` (this will download my kids' song list)
* Swipe card
* Enjoy!

## Things you might be wondering

### Why didn't you use X other thing that already exists?

There are a lot of projects I've looked at in the course of planning this that I will link as I continue to flesh out this readme! They helped me understand a lot of things and I would probably not have figured this out entirely on my own. That said, the scripts I found use Python, which is fine, but I wanted something super streamlined that didn't depend on installing other things. Also I barely understand Python and since I'm using magnetic swipe cards instead of RFID chips (mostly due to shipping constraints), I'd have to make modifications anyway.

### Why the list of URIs?

tl;dr: case sensitivity but it started out as a workaround for a wonky card reader.

I don't live in a country where I can reasonably ship things from Amazon to myself and the USB card reader somebody just brought back from the US for me only seems to read tracks 2 and 3 on cards, confirmed by testing it with real live working cards. Tracks 2 and 3 can only contain numbers, so I figured a list of songs referenced by line number would be the path of least resistance. If I get more time before I just go ahead and acquire another card reader, I'll work on supporting comments so you can identify each line or maybe make it a full-on CSV. Right now I'm doing an annoying but cheap thing where I have a Spotify playlist and select-all, right-click, copy Spotify URIs, and paste that into the `songs.txt` file. I may expand this into something where I can create labels more easily, but still working on that part.

As I was trying to figure out where to acquire another card reader, I realized that the cards can only be encoded in all-caps, and Spotify URIs are case-sensitive, so this wonky card reader actually sent me in the right direction anyway! Also, an advantage of the list of URIs is that I can update the song list on the fly without rewriting the cards, like if a URL breaks, or the kids decide they want to change a song.
