#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'
require 'meta-spotify'
require 'clipboard'

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

#Get Spotify URIs
uris = getSpotifyUris(getTopTracks())

#Copy to clipboard
Clipboard.copy(uris)
puts "Spotify Playlist copied to clipboard. Just open Spotify on your desktop and ctrl+v into a playlist!"

#If specified file, also output to file
if(ARGV[0] != nil)
	File.write(ARGV[0], uris)
	puts "Also written output to #{ARGV[0]}"
end
