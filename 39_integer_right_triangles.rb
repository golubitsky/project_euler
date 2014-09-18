#https://projecteuler.net/problem=39

solutions=Hash.new(0)
p=2
while p <= 1000
    current_solutions=[]
    a=1
    while a < p - 1
        b=1
        while b+a < p
            c=(p - a - b)
            unless a**2 + b**2 == c**2
                b+=1
                next
            end
            solution = [a,b,c].sort
            unless current_solutions.include?(solution)
                 solutions[p] += 1
                 current_solutions << solution
            end
            b+=1
        end
        a+=1
    end
    p+=1
end
p solutions.sort_by{|key, value| value}

