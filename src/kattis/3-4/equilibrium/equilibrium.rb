# Equilibrium
#
# https://open.kattis.com/problems/equilibrium

module Input
  module_function

  def mobiles(lines)
    mobile_count = lines.shift.to_i

    Array.new(mobile_count) do
      Array(eval(lines.shift))
    end
  end
end

module Equilibrium
  extend self

  def steps(mobile)
    operations = []

    operations << balance(mobile) while mobile.size > 1

    operations.count(true)
  end

  private

  def balance(child, parent = nil)
    left, right = child

    if left.is_a?(Array)
      balance(left, child)
    elsif right.is_a?(Array)
      balance(right, child)
    else
      replace(child, parent, 2 * left)

      left != right
    end
  end

  def replace(child, parent, value)
    if parent
      index =
        parent.index(child)

      parent[index] = value
    else
      child.replace([value])
    end
  end
end

mobiles = Input.mobiles(
  ARGF.readlines
)

mobiles.each do |mobile|
  steps =
    Equilibrium.steps(mobile)

  puts(steps)
end
