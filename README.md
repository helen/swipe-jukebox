# Magnetic Swipe Card Jukebox

This repo contains what I'm using to make a Musicbox+Raspberry Pi+Spotify jukebox for my kids work with magnetic swipe cards. There is a very small Bash script that waits for input from a card reader, a list of Spotify URIs (see below for why), and I'll try to explain the steps in this readme.

## Equipment
* Raspberry Pi (any model, 2+ recommended)
* MicroSD card (1GB+)
* Speakers
* WiFi adapter if needed for the Pi
* Magnetic stripe cards ([mine](https://www.amazon.com/gp/product/B00BSG7OWM/ref=ppx_od_dt_b_asin_title_s00?ie=UTF8&psc=1))
* Magnetic stripe card writer ([mine](https://www.amazon.com/gp/product/B00F372SHI/ref=ppx_od_dt_b_asin_title_s00?ie=UTF8&psc=1))
* Magnetic stripe card reader that emulates keyboard input ([mine](https://www.amazon.com/dp/B01DUB4GVO/))
* Spotify Premium account (protip if you have kids: use a family account and set up individual accounts for devices so you don’t run into playback limitations and you keep your recommendations somewhat more sane, I name them things like Alexa so if you ever see a reference to an Alexa Sandí associated with me please know that is not my actual child and somebody has sold or stolen my data)
* A computer that can flash SD cards, run the card writer driver and software, and if you want to use my templates, access Adobe Illustrator
* USB keyboard and HDMI monitor for initial setup (I used my Magic Keyboard with a cable and a TV)
* Whatever you need to print 2×3″ labels (I had them printed onto adhesive sheets at Office Depot and cut them to size myself)

## Steps (to be expanded)
1. Set up Pi MusicBox. I found their documentation to be perfectly adequate, just note that when setting up Spotify you have to authorize and generate tokens that are copied into the config file.
2. Boot up the Raspberry Pi with the card reader plugged in and log in. Test Spotify playback by running `mpc add spotify:track:7GhIk7Il098yCjg4BQjzvb && mpc play`
3. Optional but recommended: fork my GitHub repo so you have your own copy and can keep your song list edits there. After forking, be sure to edit `jukebox.sh` to point to the `songs.txt` in your own repo.
4. Run curl `https://raw.githubusercontent.com/helen/swipe-jukebox/master/jukebox.sh > jukebox.sh` (substitute in your own username if you’ve forked the repo above).
5. Set `root` to auto-login on boot and `/root/jukebox.sh` to run after login so the setup can live headlessly going forward. [These instructions](https://www.opentechguides.com/how-to/article/raspberry-pi/5/raspberry-pi-auto-start.html) work well, noting that the user for MusicBox is `root`, not `pi`.
6. Run `bash jukebox.sh`; this will download the song list referenced in the script as `songs.txt`. Enter a number like `1` at the prompt that says `Swipe:` to ensure the script is working as expected. If you want to quit the script, hit `ctrl-c`.
7. Edit `songs.txt` to your liking. I have found the easiest way to do this is to create a Spotify playlist and then select-all, right click, go to the Share menu item, select Copy Spotify URIs, and paste the result into the file.
8. Encode the cards. I found the easiest way to do this was to write them from a file, which just loads up each record sequentially and writes it to the next card you swipe. There’s both a sample file that goes up to 250 in the repo, as well as the Bash script I used to generate that file in case you want to go higher or if you get interrupted and need to make a subset. I wrote the number for each card on the back and also tested every card in the reader after writing, which at this point should trigger the appropriate playback.
9. Create the labels for the cards. I recommend you make them 2″ x 3″. There is an Illustrator template in the repo for those of you who are graphically-inclined. The intended artwork area is 1.5 inches square.
10. Print the labels for the cards and stick them on – I tested each individual one again before putting the label on because I am extremely particular, but if you make a mistake it’s fine, you can change the order of the URIs in the `songs.txt` file (and your playlist, if using one).
11. Shut down the Raspberry Pi – I find it easiest to do this by navigating to the web interface (typically at `http://musicbox.local`).
12. Box everything up and plug it in again to test the whole experience. When it’s headless, you’ll want to wait a minute or two for the green light to stop blinking so much for everything to be ready to go.
13. Enjoy!

## Things you might be wondering

### Why didn't you use X other thing that already exists?

There are a lot of projects I've looked at in the course of planning this that I will link as I continue to flesh out this readme! They helped me understand a lot of things and I would probably not have figured this out entirely on my own. That said, the scripts I found use Python, which is fine, but I wanted something super streamlined that didn't depend on installing other things. Also I barely understand Python and since I'm using magnetic swipe cards instead of RFID chips (mostly due to shipping constraints), I'd have to make modifications anyway.

### Why the list of URIs?

tl;dr: case sensitivity but it started out as a workaround for a wonky card reader.

I don't live in a country where I can reasonably ship things from Amazon to myself and the USB card reader somebody just brought back from the US for me only seems to read tracks 2 and 3 on cards, confirmed by testing it with real live working cards. Tracks 2 and 3 can only contain numbers, so I figured a list of songs referenced by line number would be the path of least resistance. If I get more time before I just go ahead and acquire another card reader, I'll work on supporting comments so you can identify each line or maybe make it a full-on CSV. Right now I'm doing an annoying but cheap thing where I have a Spotify playlist and select-all, right-click, copy Spotify URIs, and paste that into the `songs.txt` file. I may expand this into something where I can create labels more easily, but still working on that part.

As I was trying to figure out where to acquire another card reader, I realized that the cards can only be encoded in all-caps, and Spotify URIs are case-sensitive, so this wonky card reader actually sent me in the right direction anyway! Also, an advantage of the list of URIs is that I can update the song list on the fly without rewriting the cards, like if a URL breaks, or the kids decide they want to change a song.
