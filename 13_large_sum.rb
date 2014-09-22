sum = 0
File.open('13_large_sum.txt').each do |line|
    sum += line.to_i
end
p sum.to_s[0,10]
