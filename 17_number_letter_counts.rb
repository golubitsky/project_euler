#https://projecteuler.net/problem=17

WORDS = {
    1=>'one',
    2=>'two',
    3=>'three',
    4=>'four',
    5=>'five',
    6=>'six',
    7=>'seven',
    8=>'eight',
    9=>'nine',
    10=>'ten',
    11=>'eleven',
    12=>'twelve',
    13=>'thirteen',
    14=>'fourteen',
    15=>'fifteen',
    16=>'sixteen',
    17=>'seventeen',
    18=>'eighteen',
    19=>'nineteen',
    20=>'twenty',
    30=>'thirty',
    40=>'forty',
    50=>'fifty',
    60=>'sixty',
    70=>'seventy',
    80=>'eighty',
    90=>'ninety',
}


def generate_word(n)
    word=''
    if WORDS.has_key?(n)
        word = WORDS[n]
    elsif n < 100
        word = generate_under_100(n)
    elsif n < 1000
        hundred, remainder = n.divmod(100)
        word << WORDS[hundred]
        word << ' '
        word << 'hundred'
        if remainder != 0 && WORDS.has_key?(remainder)
            word << ' and '
            word << WORDS[remainder]
        elsif remainder != 0
            word << ' and '
            word << generate_under_100(remainder)
        end
    end
    word
end

def generate_under_100(n)
    word=''
    i = n
    while true
        if WORDS.has_key?(i)
          word << WORDS[i]
          word << ' '
          word << WORDS[n-i]
          break
        end
        i -= 1
    end
    word
end

def find_letter_count(min, max=min)
    total=0
    i = min
    while i <= max
        total += generate_word(i).gsub(' ','').length
        i += 1
    end
    total
end

p find_letter_count(1, 999) + "onethousand".length


















