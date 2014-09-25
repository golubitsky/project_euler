require './22_names_scores.rb'

def is_triangle?(n)
    i = 1
    eval = 0
    until eval >= n
        eval = (i * (i + 1))/2.0
        return true if eval == n
        i += 1
    end
    false
end

if $PROGRAM_NAME == __FILE__
    words = File.read('42_words.txt').scan(/\w+/)

    result = 0
    words.each do |word|
        word_value = 0
        word.split('').each do |letter|
            word_value += LETTER_VALUE[letter]
        end
        result += 1 if is_triangle?(word_value)
    end
    p result
end
