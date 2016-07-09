module Helpers
  module TranscriptsHelpers
    def save_transcript_to_file(url)
      filepath = filepath(url)
      return if File.exist?(filepath) && !File.zero?(filepath)
      transcript = parse_transcript(url)
      return if transcript.empty?
      File.write(filepath, transcript)
    end

    def parse_transcript(url)
      Nokogiri::HTML(open(url)).
        css('div.entrytext p').
        map(&:text).
        join("\n")
    rescue => e
      puts "In #{__method__}: #{e}"
      return ''
    end

    def filepath(url)
      "#{Helpers::TRANSCRIPTS_FOLDER}/#{url.split('/')[-1]}.txt"
    end
  end
end
