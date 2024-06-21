require "net/http"
require "nokogiri"

class Scraper
  attr_reader :document

  def initialize(url)
    response = Net::HTTP.get(URI(url))
    @document = Nokogiri::HTML(response)
  end

  def text(selector:)
    @document.at_css(selector).text
  end

  def texts(selector:)
    @document.css(selector).map(&:text)
  end

  def present?(selector:)
    !@document.at_css(selector).nil?
  end
end
