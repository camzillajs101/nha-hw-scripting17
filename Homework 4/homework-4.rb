require 'nokogiri'
require 'json'

puts "What do you want to search for?"
search = gets.chomp
url = "https://www.google.com/alerts/preview?params=%5Bnull\
%2C%5Bnull%2Cnull%2Cnull%2C%5Bnull%2C%22#{search}%22%2C%22c\
om%22%2C%5Bnull%2C%22en%22%2C%22US%22%5D%2Cnull%2Cnull%2Cnu\
ll%2C0%2C1%5D%2Cnull%2C3%2C%5B%5Bnull%2C1%2C%22user%40examp\
le.com%22%2C%5Bnull%2Cnull%2C23%5D%2C2%2C%22en-US%22%2Cnull\
%2Cnull%2Cnull%2Cnull%2Cnull%2C%220%22%2Cnull%2Cnull%2C%22A\
B2Xq4hcilCERh73EFWJVHXx-io2lhh1EhC8UD8%22%5D%5D%5D%2C0%5D"
doc = Nokogiri::HTML(open(url))
doc.css(".result_set").each do |x|
  puts x.content
end
