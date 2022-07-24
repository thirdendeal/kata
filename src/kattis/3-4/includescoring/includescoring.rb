# #include<scoring>
#
# https://open.kattis.com/problems/includescoring

module Input
  extend self

  Record = Struct.new(
    :problems_solved,
    :time_penalty,
    :last_submission,
    :extra_point
  )

  def score_table
    numbers(DATA.read)
  end

  def scores(lines)
    Enumerator.new do |yielder|
      contestants = lines.shift.to_i

      contestants.times do
        yielder << numbers(lines.shift)
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

module Refinements
  refine Enumerable do
    def stable_sort_by
      sort_by.with_index do |element, index|
        [yield(element), index]
      end
    end
  end
end

def score(rank); end

using Refinements

scores = Input.scores(
  ARGF.readlines
)

records = scores.map do |row|
  Input::Record.new(*row)
end

ranking =
  records
  .stable_sort_by(&:last_submission)
  .stable_sort_by(&:time_penalty)
  .stable_sort_by { |record| -record.problems_solved }

table = Input.score_table

ranking.each_with_index do |record, index|
  puts(table[index].to_i + record.extra_point)
end

__END__

100
75
60
50
45
40
36
32
29
26
24
22
20
18
16
15
14
13
12
11
10
9
8
7
6
5
4
3
2
1
