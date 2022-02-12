# A Different Problem
#
# https://open.kattis.com/problems/different

ARGF.each do |line|
  match =
    line
    .scan(/[[:digit:]]+/)

  difference =
    match[0].to_i - match[1].to_i

  puts(difference.abs)
end
