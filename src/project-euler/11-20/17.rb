# Number letter counts
#
# https://projecteuler.net/problem=17

module Cardinal
  ONES, TEENS, TENS, ORDER = DATA.read.strip.lines.map do |line|
    line.chomp.split(', ')
  end

  module_function

  def cardinal(number)
    digits =
      number
      .digits
      .reverse

    delegate(digits)
  end

  def delegate(digits)
    case digits.size
    when 1
      ONES[*digits]
    when 2
      tens(*digits)
    when 3
      repeat(*digits, separator: ' and ')
    else
      repeat(*digits)
    end
  end

  def tens(tens, ones)
    if ones == 0
      TENS[tens]
    elsif tens == 1
      TEENS[ones]
    else
      "#{TENS[tens]}-#{ONES[ones]}"
    end
  end

  def repeat(first, *remaining, separator: ' ')
    if remaining.sum.zero?
      "#{ONES[first]} #{ORDER[remaining.size]}"
    else
      "#{ONES[first]} #{ORDER[remaining.size]}#{separator}#{delegate(remaining)}"
    end
  end
end

cardinals = 1.upto(1000).map do |number|
  Cardinal.cardinal(number)
end

count =
  cardinals
  .join
  .scan(/[[:word:]]/)
  .size

puts(count) # => 21124

__END__

zero, one, two, three, four, five, six, seven, eight, nine
, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
, ten, twenty, thirty, forty, fifty, sixty, seventy, eighty, ninety
, , hundred, thousand, million, billion, trillion, quadrillion, quintillion, sextillion, septillion
