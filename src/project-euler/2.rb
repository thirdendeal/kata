# Even Fibonacci numbers
#
# https://projecteuler.net/problem=2

def fibonacci(left, right)
  Enumerator.produce do
    left, right = right, left + right

    right
  end
end

sequence = fibonacci(0, 1)

segment = sequence.take_while do |term|
  term < 4_000_000
end

terms = segment.select(&:even?)

puts(terms.sum) # => 4613732
