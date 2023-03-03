# Watchdog
#
# https://open.kattis.com/problems/watchdog

module Input
  extend self

  def roofs(lines)
    test_cases = lines.shift.to_i

    test_cases.times do
      side, hatches = numbers(lines.shift)

      hatches = Array.new(hatches) do
        numbers(lines.shift)
      end

      yield [side, hatches]
    end
  end

  private

  def numbers(string)
    string
      .scan(/[[:digit:]]+/)
      .map(&:to_i)
  end
end

module Solution
  extend self

  def search(roof)
    side, hatches = roof

    1.upto(side / 2) do |a|
      a.upto(side - a) do |b|
        found = in_reach?([a, b], a, hatches)

        return "#{a} #{b}" if found
      end
    end

    'poodle'
  end

  private

  def distance(point_a, point_b)
    x1, y1 = point_a
    x2, y2 = point_b

    Math.sqrt(
      ((x2 - x1)**2) + ((y2 - y1)**2)
    )
  end

  def in_reach?(point, distance, points)
    a, b = point

    points.all? do |x, y|
      next if x == a && y == b

      distance >= distance([a, b], [x, y])
    end
  end
end

lines = ARGF.readlines

Input.roofs(lines) do |roof|
  puts(Solution.search(roof))
end
