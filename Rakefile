# Kata - Rakefile
# ----------------------------------------------------------------------

# Usage: rake euler[pattern]
#
# e.g.:  rake euler[1]
# e.g.:  rake euler["{1\,2}"]

task :euler do |_, arguments|
  argv = arguments.to_a

  queue = search(
    'source/project-euler',
    argv[0]
  )

  queue.each do |script|
    euler(script)
  end
end
