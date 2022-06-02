# Longest Collatz sequence
#
# https://projecteuler.net/problem=14

def collatz(number)
  Enumerator.produce(number) do |previous|
    if previous.even?
      previous / 2
    else
      previous * 3 + 1
    end
  end
end

range = 1.upto(1_000_000)

longest = range.max_by do |number|
  sequence =
    collatz(number)

  sequence.find_index(1) + 1
end

puts(longest) # => 837799
