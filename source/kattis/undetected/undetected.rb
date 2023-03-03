# UnDetected
#
# https://open.kattis.com/problems/undetected

class Field
  def initialize(width, height)
    @width  = width
    @height = height

    @grid =
      Array.new(@height) do
        Array.new(@width) { true }
      end
  end

  def route?
    route_fold = @grid.reduce do |current, forward|
      merge(current, forward) do |a, b|
        a && b
      end
    end

    route_fold.any?
  end

  def toggle_sensor(point, radius)
    0.upto(@width - 1) do |x|
      0.upto(@height - 1) do |y|
        next if distance(point, [x, y]) > radius

        @grid[-y - 1][x] ^= true
      end
    end
  end

  private

  def merge(array_a, array_b)
    Array.new(array_a.size) do |index|
      yield array_a[index], array_b[index]
    end
  end

  def distance(point_a, point_b)
    x1, y1 = point_a
    x2, y2 = point_b

    Math.sqrt(((x2 - x1)**2) + ((y2 - y1)**2))
  end
end

def sensors(lines)
  Enumerator.new do |yielder|
    line_count = lines.shift.to_i

    line_count.times do
      yielder <<
        lines
        .shift
        .scan(/[[:digit:]]+/)
        .map(&:to_i)
    end
  end
end

field = Field.new(200, 300)

sensors = sensors(
  ARGF.readlines
)

largest_k = sensors.find_index do |x, y, radius|
  field.toggle_sensor([x, y], radius)

  !field.route?
end

puts(largest_k)
