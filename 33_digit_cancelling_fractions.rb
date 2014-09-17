#https://projecteuler.net/problem=33

digit_cancelling_fractions=[]
denominator = 11
while denominator < 100
    numerator = 10
    while numerator < denominator
        num_digits=numerator.to_s.split('').map(&:to_i)
        denom_digits=denominator.to_s.split('').map(&:to_i)
        if num_digits[1]==0
            numerator += 1
            next
        end
        n = Rational(numerator, denominator)
        if num_digits[0]==denom_digits[0] && denom_digits[1]!=0 && n==Rational(num_digits[1], denom_digits[1])
            digit_cancelling_fractions << [numerator, denominator]
        elsif num_digits[0]==denom_digits[1] && denom_digits[0]!=0 && n==Rational(num_digits[1], denom_digits[0])
            digit_cancelling_fractions << [numerator, denominator]
        elsif num_digits[1]==denom_digits[0] && denom_digits[1]!=0 && n==Rational(num_digits[0], denom_digits[1])
            digit_cancelling_fractions << [numerator, denominator]
        elsif num_digits[1]==denom_digits[1] && denom_digits[0]!=0 && n==Rational(num_digits[0], denom_digits[0])
            digit_cancelling_fractions << [numerator, denominator]
        end
        numerator += 1
    end
    denominator += 1
end

num_final=1
denom_final=1
digit_cancelling_fractions.each do |fraction|
    num_final *= fraction[0]
    denom_final *= fraction[1]
end
p Rational(num_final, denom_final)


