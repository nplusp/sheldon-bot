module TranscriptsHelpers
  def save_transcript_to_file(filepath, url)
    transcript = parse_transcript(url)
    return if transcript.empty?
    File.write(filepath, transcript)
  end

  def parse_transcript(url)
    Nokogiri::HTML(open(url)).
      css('div.entrytext p').
      map(&:text).
      join("\n\n")
  rescue => e
    puts "In #{__method__}: #{e}"
    return ''
  end

  def parse_title(url)
    url.split('/')[-1]
  end
end
