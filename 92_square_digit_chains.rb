#https://projecteuler.net/problem=92

def next_number(n)
  n.to_s.chars.map do |n|
    n = n.to_i
    n ** 2
  end.inject(:+)
end

if $PROGRAM_NAME == __FILE__
  i = 1
  count_89 = 0
  while i < 10000000
    n = i
    while true
      n = next_number(n)
      break if n == 1 || n == 89
    end
    i += 1
    count_89 += 1 if n == 89
  end
  p count_89
end
