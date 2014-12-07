def factorial(n)
  return 1 if n == 0
  (1..n).inject(:*)
end

def break_number_into_array(n)
  n.to_s.split('').map(&:to_i)
end

def one_step(n)
  break_number_into_array(n).map{ |n| factorial(n) }.inject(:+)
end

def define_factorial_hash
  hash = Hash.new
  (1..9).each { |n| hash[n] = factorial(n) }
  hash
end

numbers = []
(1..100000).each do |n|
  numbers << n if one_step(n) == n && (1..2).include?(n) == false
end

puts numbers.inject(:+)
