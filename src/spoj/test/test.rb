# TEST - Life, the Universe, and Everything
#
# https://www.spoj.com/problems/TEST/

ARGF.each_line do |line|
  break if line == "42\n"

  puts(line)
end
