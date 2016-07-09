class Transcript
  include LinksHelpers
  include TranscriptsHelpers

  def run
    set_transcripts_links
    save_transcripts_files
  end

  def set_transcripts_links
    read_links_from_file
    return unless @links.empty?
    parse_links_from_website
    save_links_to_file
  end

  def save_transcripts_files
    @links.each do |url|
      filepath = "#{TRANSCRIPTS_FOLDER}/#{parse_title(url)}.txt"
      next if File.exist?(filepath) && !File.zero?(filepath)
      save_transcript_to_file(filepath, url)
    end
  end
end
