class Parse
  def run
    Dir.glob('./transcripts/*.txt') do |filename|
      next if next_matcher(filename)
      transcript = File.read("#{filename}")
      text = mltext(transcript)
      text.each { |t| mlfile.puts t }
    end
  ensure
    mlfile.close
  end

  def mltext(transcript)
    lines = transcript.scan(/^.+$\n^Sheldon:.+$/)
    lines.map { |line| line.gsub(/.+:/, '').split("\n").map { |l| "\"#{l.lstrip}\""}.join(',') }
  end

  def mlfile
    @mlfile ||= File.open('mltext.txt', 'w+')
  end

  def next_matcher(filename)
    filename == './transcripts/transcripts_links.txt'
  end
end
