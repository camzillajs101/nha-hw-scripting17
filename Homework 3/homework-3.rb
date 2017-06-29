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

new_ary = array.reject { |c| c.empty? }

get '/' do
  content_type :json
  { :usernames => new_ary }.to_json
end
