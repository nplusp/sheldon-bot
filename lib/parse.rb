class Parse
  def run
    Dir.glob('./transcripts/*.txt') do |filename|
      next if next_matcher(filename)
      transcript = File.read("#{filename}")
      mltext = transcript.scan(/^.+$\n^Sheldon:.+$/).join("\n\n")
      mlfile.puts mltext
      mlfile.puts "\n"
    end
  ensure
    mlfile.close
  end

  def mlfile
    @mlfile ||= File.open('mltext.txt', 'w+')
  end

  def next_matcher(filename)
    filename == './transcripts/transcripts_links.txt'
  end
end
