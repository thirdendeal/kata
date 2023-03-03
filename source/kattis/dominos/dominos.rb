# Dominos
#
# https://open.kattis.com/problems/dominos

module Input
  extend self

  def cases(lines)
    Enumerator.new do |yielder|
      case_number = lines.shift.to_i

      case_number.times do
        dominos, mapping_number =
          numbers(lines.shift)

        mappings = Array.new(mapping_number) do
          numbers(lines.shift)
        end

        yielder << [dominos, mappings]
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

cases.each do |dominos, mappings|
  knocked =
    mappings.map(&:last)

  puts(dominos - knocked.size)
end
