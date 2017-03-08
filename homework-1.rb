require "csv"

array = []
File.open("homework-1_numbers.csv") do |file|
	file.each do |line|
		array << line
	end
end

puts array