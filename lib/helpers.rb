# frozen_string_literal: true
require_relative 'helpers/links_helpers'
require_relative 'helpers/transcripts_helpers'

module Helpers
  include LinksHelpers
  include TranscriptsHelpers

  TRANSCRIPTS_URL = 'https://bigbangtrans.wordpress.com'
  TRANSCRIPT_MATCHER = "#{TRANSCRIPTS_URL}/series-"
  TRANSCRIPTS_FOLDER = 'transcripts'
  TRANSCRIPTS_LINKS = "#{TRANSCRIPTS_FOLDER}/transcripts_links.txt"
end
