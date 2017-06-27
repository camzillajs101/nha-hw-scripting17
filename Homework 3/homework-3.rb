require 'nokogiri'
require 'sinatra'

url = "https://www.twitter.com"
doc = Nokogiri::HTML(open(url))
doc.css("span.username.u-dir b").each do |x|
  puts x.content
end
