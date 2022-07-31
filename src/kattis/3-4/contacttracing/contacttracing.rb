# Contact Tracing
#
# https://open.kattis.com/problems/contacttracing

def numbers(string)
  string
    .scan(/[[:digit:]]+/)
    .map(&:to_i)
end

# Input

lines = ARGF.readlines

people, days =
  numbers(lines.shift)

infected, *infected_one_indices =
  numbers(lines.shift)

times = people.times.map do
  numbers(lines.shift)
end

# Solution

infected_indices =
  infected_one_indices
  .first(infected)
  .map(&:pred)

days.times do
  infected_contacts = []

  infected_indices.each do |i|
    a, b = times[i]

    infected_contacts = 0.upto(people - 1).filter do |j|
      x, y = times[j]

      x.between?(a, b) || y.between?(a, b) || (x..y).cover?(a..b)
    end
  end

  infected_indices |=
    infected_contacts
end

output =
  infected_indices
  .sort
  .map(&:succ)
  .join(' ')

puts(output)
