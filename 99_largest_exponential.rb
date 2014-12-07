#https://projecteuler.net/problem=99

if $PROGRAM_NAME == __FILE__
  largest_number = 0
  line_with_largest_number = 0
  line_number = 0
  File.open("99_base_exp.txt", "r") do |f|
    f.each do |line|
      line_number += 1
      base, exponent = line.scan(/\w+/).map(&:to_i)
      result = exponent * Math.log(base)
      if result > largest_number
        largest_number = result
        line_with_largest_number = line_number
      end
    end
  end
  puts line_with_largest_number
end
