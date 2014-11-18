ROM_TO_DEC = {"M"=>1000, "CM"=>900, "D"=>500, "CD"=>400, "C"=>100, "XC"=>90, "L"=>50, "XL"=>40, "X"=>10, "IX"=>9, "V"=>5, "IV"=>4, "I"=>1}

DEC_TO_ROM = { 1000=> 'M', 900=> 'CM', 500=> 'D', 400=> 'CD', 100=> 'C', 90=> 'XC', 50=> 'L', 40=> 'XL', 10=> 'X', 9=> 'IX', 5=> 'V', 4=> 'IV', 1=> 'I', }

def roman_to_decimal(roman)
  decimal = 0
  while roman.length > 0
    if roman.length >= 2 && ROM_TO_DEC.keys.include?(roman[0,2])
      decimal += ROM_TO_DEC[ roman[0,2] ]
      roman[0,2] = ''
    elsif roman.length >= 1 && ROM_TO_DEC.keys.include?(roman[0,1])
      decimal += ROM_TO_DEC[ roman[0,1] ]
      roman[0,1] = ''
    end
  end
  decimal
end

def decimal_to_roman(decimal)
  roman = ''
  DEC_TO_ROM.each do |decimal_key, roman_string|
    while decimal % decimal_key < decimal_key
      break if decimal < decimal_key
      decimal -= decimal_key
      roman << roman_string
    end
  end
  roman
end

def count_chars_saved(roman)
  original_length = roman.length
  decimal = roman_to_decimal(roman)
  optimal_length = decimal_to_roman(decimal).length
  original_length - optimal_length
end

if $PROGRAM_NAME == __FILE__
  total_chars_saved = 0
  File.open("./89_roman.txt", "r") do |f|
    f.each do |line|
      roman = line[/\n/] ? line.strip! : line
      total_chars_saved += count_chars_saved(roman)
    end
  end
  p total_chars_saved
end
