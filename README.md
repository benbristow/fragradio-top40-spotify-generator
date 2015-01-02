FragRadio Top40 Spotify Playlist Generator
==========================================

![FragRadio Logo](http://fragradio.com/images/logo.png)

What it does
-------------

Generates Spotify Playlists from Fragradio.com's Top 40 Requested Tracks.
This could easily be modified for any station that uses SAM Broadcaster's built in web-request system.

How to use/install
----------------

- Clone this repo and cd into it.

- Make sure you have Ruby installed (2.1.5 recommended) & RubyGems. This is easiest with RVM (http://rvm.io)

- Make sure you have Bundler installed

```
gem install bundler
```

- Install dependencies with Bundler

```
bundle install
```

If you're on GNU/Linux, you might need to install xclip and xsel if you don't have them already. Do this through your
package manager.

- Run the script

```
ruby ./frag.rb
```

- If all was successful, all you need to do now is open your Spotify Desktop Client and paste (ctrl+v) into
a playlist of your choosing.

- Enjoy the music!

Acknowledgements
-------------------

- Meta Spotify by philnash - https://github.com/philnash/meta-spotify

- Clipboard by janlelis - https://github.com/janlelis/clipboard

- Nokogiri by Sparklemotion - https://github.com/sparklemotion/nokogiri
