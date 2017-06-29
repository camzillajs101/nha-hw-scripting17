require 'nokogiri'
require 'sinatra'
require 'json'
require 'open-uri'

array = []
url = "https://www.twitter.com"
doc = Nokogiri::HTML(open(url))
doc.css("span.username.u-dir b").each do |x|
  array << x.content
end

get '/' do
  content_type :json
  { :usernames => array }.to_json
end
