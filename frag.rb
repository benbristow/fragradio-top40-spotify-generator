#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'
require 'meta-spotify'
require 'clipboard'

#Don't edit below this line unless you know what you're doing.

def getTopTracks
  #Create new array
  tracks = Array.new

  #Extract top 40 tracks
  @doc = Nokogiri::HTML(open("http://fragradio.com/includes/adjreq/web/playlist.php"))
  @doc.xpath("//*[@id=\"top_requests\"]/dl/dd").each do |node|
    tracks.push(node.xpath("a")[0]['title'])
  end

  #Return array
  return tracks
end

def getSpotifyUris(tracks)
  count = 0
  outputString = ""
  tracks.each do |track|
    count += 1
    begin
      results = MetaSpotify::Track.search(track)
      outputString += "\n #{results[:tracks][0].uri}"
      puts "#{count}> Found Spotify URI for #{track}"
    rescue NoMethodError
      puts "#{count}> Can't find Spotify track for #{track}"
    end
  end

  return outputString
end

Clipboard.copy(getSpotifyUris(getTopTracks()))
puts "Spotify Playlist copied to clipboard. Just open Spotify on your desktop and ctrl+v into a playlist!"
