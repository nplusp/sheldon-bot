require 'pry'
require 'nokogiri'
require 'mechanize'
require 'open-uri'
require_relative 'lib/helpers'
require_relative 'lib/transcript'
require_relative 'lib/parse'

Transcript.new.run
puts "Done with transcripts"
Parse.new.run
puts "Done with parsing"
