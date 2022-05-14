# Even Fibonacci numbers
#
# https://projecteuler.net/problem=2

def fibonacci(first, second)
  Enumerator.produce do
    first.tap do
      first, second = second, first + second
    end
  end
end

sequence = fibonacci(1, 2)

terms = sequence.take_while do |term|
  term < 4_000_000
end

terms = terms.filter(&:even?)

puts(terms.sum) # => 4613732
