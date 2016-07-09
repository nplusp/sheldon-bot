module Helpers
  module LinksHelpers
    def read_links_from_file
      check_directory
      @links = []
      file = File.open(Helpers::TRANSCRIPTS_LINKS)
      file.each_line { |url| @links << url.strip }
    rescue => e
      puts "In #{__method__}: #{e}"
      return
    end

    def check_directory
      Dir.mkdir(Helpers::TRANSCRIPTS_FOLDER) unless File.directory?(Helpers::TRANSCRIPTS_FOLDER)
    end

    def parse_links_from_website
      agent = Mechanize.new
      page = agent.get(Helpers::TRANSCRIPTS_URL)
      @links =
        page.links
          .map!(&:uri)
          .map!(&:to_s)
          .select { |url| url.include?(Helpers::TRANSCRIPT_MATCHER) }
    end

    def save_links_to_file
      return if File.exist?(Helpers::TRANSCRIPTS_LINKS) && !File.zero?(Helpers::TRANSCRIPTS_LINKS)
      File.write(Helpers::TRANSCRIPTS_LINKS, @links.join("\n"))
    end
  end
end
