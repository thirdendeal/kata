# 1000-digit Fibonacci number
#
# https://projecteuler.net/problem=25

def fibonacci(first = 1, second = 1)
  Enumerator.produce do
    first.tap do
      first, second = second, first + second
    end
  end
end

index = fibonacci.find_index do |term|
  term.digits.size >= 1000
end

puts(index + 1) # => 4782
