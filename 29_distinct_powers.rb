#https://projecteuler.net/problem=29

def distinct_powers(x)
    result=[]
    n=2
    while n <= x
        power=2
        while power <= x
            result << n ** power unless result.include? n ** power
            power += 1
        end
        n += 1
    end
    result
end

if $PROGRAM_NAME == __FILE__
p distinct_powers(100).length
end
