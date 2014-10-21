# https://projecteuler.net/problem=80

require 'bigdecimal'

def irrational_squares
	numbers = [*1..100]
	(1..10).each { |n| numbers.delete(n**2) }
	numbers
end

def sum_digits_of_square_root(n)
	square_root = BigDecimal.new("#{n}").sqrt(101)
	arr = square_root.to_s.scan(/\d+/)
	str = arr[1][0...100]
	str.split('').map(&:to_i).inject(:+)
end

sum = 0
irrational_squares.each do |n|
 sum += sum_digits_of_square_root(n)
end
p sum
