class ReportDownloader
  attr_reader :url

  require 'open-uri'
  require 'net/http'

  def initialize(url)
    @url = url
  end

  def download(target)
    uri = get_file_uri
    FileUtils.mkdir_p File.dirname(target)
    Net::HTTP.start(uri.host) do |http|
      resp = http.get(uri.path)
      open(target, "wb") do |file|
        file.write(resp.body)
      end
    end
    target
  end

  def get_file_uri
    doc = Nokogiri::HTML(open(url))
    container = doc.css('#objectTtl').first.next.next.next
    URI.parse container.css('a').first['href']
  end
end