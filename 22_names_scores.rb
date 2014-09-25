#https://projecteuler.net/problem=22

LETTER_VALUE, = {
    "A"=>1,
    "B"=>2,
    "C"=>3,
    "D"=>4,
    "E"=>5,
    "F"=>6,
    "G"=>7,
    "H"=>8,
    "I"=>9,
    "J"=>10,
    "K"=>11,
    "L"=>12,
    "M"=>13,
    "N"=>14,
    "O"=>15,
    "P"=>16,
    "Q"=>17,
    "R"=>18,
    "S"=>19,
    "T"=>20,
    "U"=>21,
    "V"=>22,
    "W"=>23,
    "X"=>24,
    "Y"=>25,
    "Z"=>26,
}

def find_alphabetical_value(name, i)
    value = 0
    name.each_char do |char|
        value += LETTER_VALUE[char]
    end
    value * (i + 1)
end

if $PROGRAM_NAME == __FILE__
    names = []
    names = File.read('22_names.txt').scan(/\w+/).sort
    result = 0
    names.each_with_index do |name, index|
        result += find_alphabetical_value(name, index)
    end
    p result
end
