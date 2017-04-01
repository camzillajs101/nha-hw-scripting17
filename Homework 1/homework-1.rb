require "csv"

array = []
File.open("homework-1_numbers.csv") do |file|
	file.each do |line|
		array << line
	end
end

def format(ary)
	final = []
	first = []
	middle = []
	last = []
	ary.each do |i|
		temp = ary[i]
		first << temp[0..2]
		middle << temp[3..5]
		last << temp[6..8]
		final << "+1 (#{first[i]})-#{middle[i]}-#{last[i]}"
	end
	final
end
puts format([3476684595])
