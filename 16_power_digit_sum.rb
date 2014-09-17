#https://projecteuler.net/problem=16

if $PROGRAM_NAME == __FILE__
    p (2**1000).to_s.split('').map(&:to_i).inject(:+)
end
