require 'nokogiri'
require 'sinatra'
require 'json'
require 'open-uri'

hash = {}
iterations = 0
url = "https://www.twitter.com"
doc = Nokogiri::HTML(open(url))
doc.css("span.username.u-dir b").each do |x|
  puts x.content
end
