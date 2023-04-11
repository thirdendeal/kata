# Kata - Rakefile
# ----------------------------------------------------------------------

task 'project-euler': :euler

# ----------------------------------------------------------------------

# Usage: rake euler[pattern,verbose]
#
# rake euler[1]
# rake euler[1,]
#
# rake euler["{1\,2}"]
# rake euler["{1\,2},"]

task :euler do |_, arguments|
  pattern, verbose = *arguments

  queue = search(
    'project-euler',
    pattern
  )

  queue.each do |script|
    report(script, verbose)
  end
end

# ----------------------------------------------------------------------

# Usage: rake kattis[pattern,verbose]
#
# rake kattis[different]
# rake kattis[different,]
#
# rake kattis[diff]
# rake kattis[diff,]

task :kattis do |_, arguments|
  pattern, verbose = *arguments

  queue = search(
    'kattis',
    pattern
  )

  queue.each do |script|
    report(script, verbose)
  end
end
