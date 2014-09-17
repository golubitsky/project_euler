#https://projecteuler.net/problem=10

require './35_circular_primes.rb'

if $PROGRAM_NAME == __FILE__
p find_primes(2_000_000).inject(:+)
end
