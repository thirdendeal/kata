# Yoda
#
# https://open.kattis.com/problems/yoda

def collide(left, right)
  left  = left.digits
  right = right.digits

  leftovers = left.each_index.map do |index|
    digit  = left[index]
    number = right[index].to_i

    digit if digit >= number
  end

  leftovers.reverse
end

def yoda(left, right)
  leftovers = collide(left, right)

  if leftovers.any?
    leftovers.join.to_i
  else
    'YODA'
  end
end

left  = ARGF.readline.to_i
right = ARGF.readline.to_i

puts(yoda(left, right))
puts(yoda(right, left))
