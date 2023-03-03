# Inverse Factorial
#
# https://open.kattis.com/problems/inversefactorial

def inverse_factorial(factorial)
  fold = 1

  1.step.find do |number|
    fold *= number

    break if fold > factorial

    fold == factorial
  end
end

number = inverse_factorial(
  ARGF.readline.to_i
)

puts(number)
