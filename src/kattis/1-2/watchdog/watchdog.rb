# Watchdog
#
# https://open.kattis.com/problems/watchdog

def numbers(string)
  string
    .scan(/[[:digit:]]+/)
    .map(&:to_i)
end

def roofs(lines)
  test_cases = lines.shift.to_i

  test_cases.times do
    side, hatches = numbers(lines.shift)

    hatches = hatches.times.map do
      numbers(lines.shift)
    end

    yield [side, hatches]
  end
end

def search(roof)
  side, hatches = roof

  1.upto(side / 2) do |x|
    leash = x

    x.upto(side - x) do |y|
      reach = hatches.all? do |hatch_x, hatch_y|
        next if hatch_x == x && hatch_y == y

        delta_x = hatch_x - x
        delta_y = hatch_y - y

        distance = Math.sqrt(delta_x**2 + delta_y**2)

        leash >= distance
      end

      return "#{x} #{y}" if reach
    end
  end

  'poodle'
end

lines = ARGF.readlines

roofs(lines) do |roof|
  puts(search(roof))
end
