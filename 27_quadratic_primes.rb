#https://projecteuler.net/problem=27

class Quadratic
  attr_reader :b_values
  def initialize
    @a = -1000
    @b = 2
    @b_counter = 0
    @b_values = generate_primes_up_to_1000
    @answer = []
    @most_consecutive_primes = 0
  end

  def solve_problem
    while @a <= 1000
      n = 0
      while true
        y = solve_quadratic(n)
        break if y < 2
        break unless is_prime?(y)
        n += 1
      end
      check(n)
      next_pair
    end
    puts "consecutive primes: #{@most_consecutive_primes}"
    puts "a: #{@answer[0]}"
    puts "b: #{@answer[1]}"
    puts "product: #{@answer[0] * @answer[1]}"
  end

  private

  def next_pair
    @b_counter < @b_values.length - 1 ? @b_counter += 1 : @b_counter = 0
    if @b_counter == 0
      @a += 1
    end
    @b = @b_values[@b_counter]
  end

  def solve_quadratic(n)
    (n ** 2) + (@a * n) + @b
  end

  def check(count)
    if count > @most_consecutive_primes
        @most_consecutive_primes = count
        @answer = [@a, @b]
    end
  end

  def is_prime?(n)
    return false if n==0 || n==1
    return true if n==2
    i=2
    while i <= Math.sqrt(n)
        return false if n % i == 0
        i +=1
    end
    true
  end

  def generate_primes_up_to_1000
    primes = []
    (2..1000).each {|n| primes << n if is_prime?(n) }
    primes
  end
end

if $PROGRAM_NAME == __FILE__
  solver = Quadratic.new
  solver.solve_problem
end
