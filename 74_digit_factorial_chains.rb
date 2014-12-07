#https://projecteuler.net/problem=74

require_relative '34_digit_factorials.rb'

def count_steps(n)
  numbers = [n]
  until numbers.include? one_step(n)
    n = one_step(n)
    numbers << n
  end
  numbers.length
end

def solve_problem
  count = 0
  (1..1000000).each do |n|
    count += 1 if count_steps(n) == 60
  end
  count
end

p solve_problem
