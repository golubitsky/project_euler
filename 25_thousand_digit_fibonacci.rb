def fib(n)
    return 1 if n==1 || n==2
    a = 1
    b = 1
    i = 3
    while i <= n
        result = a + b
        a = b
        b = result
        i += 1
    end
    result
end

def find_1000
    i=1
    while true
        return i if fib(i).to_s.length == 1000
        i+=1
    end
end

p find_1000
