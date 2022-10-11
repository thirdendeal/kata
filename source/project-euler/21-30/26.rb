# Reciprocal cycles
#
# https://projecteuler.net/problem=26

def reciprocal_cycle_lenght(number)
  offsets   = {}
  remainder = 1

  1.step do |offset|
    remainder = (10 * remainder) % number

    break if remainder == 0

    if offsets[remainder]
      length = offset - offsets[remainder]

      return length
    else
      offsets[remainder] = offset
    end
  end
end

maximum = 1.upto(1000).max_by do |number|
  reciprocal_cycle_lenght(number) || 0
end

puts(maximum) # => 983
