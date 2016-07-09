# frozen_string_literal: true

module LinksHelpers
  TRANSCRIPTS_URL = 'https://bigbangtrans.wordpress.com'
  TRANSCRIPT_MATCHER = "#{TRANSCRIPTS_URL}/series-"
  TRANSCRIPTS_FOLDER = 'transcripts'
  TRANSCRIPTS_LINKS = "#{TRANSCRIPTS_FOLDER}/transcripts_links.txt"

  def read_links_from_file
    check_directory
    @links = []
    file = File.open(TRANSCRIPTS_LINKS)
    file.each_line { |url| @links << url.strip }
  rescue => e
    puts "In #{__method__}: #{e}"
    return
  end

  def check_directory
    Dir.mkdir(TRANSCRIPTS_FOLDER) unless File.directory?(TRANSCRIPTS_FOLDER)
  end

  def parse_links_from_website
    agent = Mechanize.new
    page = agent.get(TRANSCRIPTS_URL)
    @links =
      page.links
        .map!(&:uri)
        .map!(&:to_s)
        .select { |url| url.include?(TRANSCRIPT_MATCHER) }
  end

  def save_links_to_file
    return if File.exist?(TRANSCRIPTS_LINKS) && !File.zero?(TRANSCRIPTS_LINKS)
    File.write(TRANSCRIPTS_LINKS, @links.join("\n"))
  end
end
