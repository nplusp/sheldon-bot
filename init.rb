require 'pry'
require 'nokogiri'
require 'mechanize'
require 'open-uri'
require_relative 'lib/helpers/links_helpers'
require_relative 'lib/helpers/transcripts_helpers'
require_relative 'lib/transcript'

Transcript.new.run
puts "DONE"
