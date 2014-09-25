#https://projecteuler.net/problem=52

def find_multiple
    i=1
    while true
        a = i.to_s.split('').sort.join
        b = (2 * i).to_s.split('').sort.join
        c = (3 * i).to_s.split('').sort.join
        d = (4 * i).to_s.split('').sort.join
        e = (5 * i).to_s.split('').sort.join
        f = (6 * i).to_s.split('').sort.join
        return i if a==b && b==c && c==d && d==f && e==f
        i += 1
    end
end

p find_multiple
