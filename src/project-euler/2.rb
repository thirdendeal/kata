# Even Fibonacci numbers
#
# https://projecteuler.net/problem=2

def fibonacci(current, following)
  Enumerator.new do |yielder|
    loop do
      yielder << current

      current, following = following, following + current
    end
  end
end

generator = fibonacci(1, 2)

sequence = generator.take_while do |term|
  term < 4_000_000
end

numbers = sequence.select(&:even?)

puts(numbers.sum) # => 4613732
