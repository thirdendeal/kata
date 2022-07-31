# Knapsack
#
# https://open.kattis.com/problems/knapsack

module Input
  extend self

  def cases(lines)
    Enumerator.new do |yielder|
      while lines.first
        capacity, object_number =
          numbers(lines.shift)

        objects = object_number.times.map do
          numbers(lines.shift)
        end

        yielder << [capacity, objects]
      end
    end
  end

  private

  def numbers(string)
    string
      .scan(/[[:digit:]]+/)
      .map(&:to_i)
  end
end

cases = Input.cases(
  ARGF.readlines
)

cases.each do |capacity, objects|
  objects =
    objects
    .map
    .with_index

  objects = objects.sort_by do |object, _index|
    -Rational(*object)
  end

  sum = 0

  selection = objects.take_while do |object, _index|
    _value, weight = object

    sum += weight

    sum <= capacity
  end

  indices =
    selection
    .map(&:last)
    .sort

  puts(indices.size)
  puts(indices.join(' '))
end
