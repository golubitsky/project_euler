#https://projecteuler.net/problem=26
require 'bigdecimal'

def find_recurring_cycles
i=1
most_repeats = 0
denominator = 0
while i <= 1000
    n = BigDecimal.new('1.0').div( i, 10000 )
    arr = n.to_s.scan(/\d+/)
    str=arr[1]
    repeats = how_many_repeats?(str)
    if repeats > most_repeats
        most_repeats = repeats
        denominator = i
    end
    i += 1
end
denominator.to_i
end

def how_many_repeats?(str)
    i = 1
    most_repeats = 0
    while i <= str.length/2
        a = str[0,i]
        b = str[i,i]
        c = str[2*i,i]
        if a == b && b == c
            return most_repeats if a.length / 2 == most_repeats
            most_repeats = a.length
        end
        i += 1
    end
    0
end

#p find_recurring_cycles
p find_recurring_cycles
