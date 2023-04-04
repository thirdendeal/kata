# Kata - Rakefile
# ----------------------------------------------------------------------

# Usage: rake profile[root-pattern,filename-pattern]
#
# rake profile[project-euler,1]
# rake profile["project-euler,{1\,2}"]

task :profile do |_, arguments|
  root, filename = arguments.to_a

  queue = Dir.glob(
    "source/#{root}/**/#{filename}.rb"
  )

  queue.each do |script|
    profile(script)
  end
end

# ----------------------------------------------------------------------

task 'project-euler': :euler

# ----------------------------------------------------------------------

# Usage: rake euler[filename-pattern]
#
# rake euler[1]
# rake euler["{1\,2}"]

task :euler do |_, arguments|
  pattern,  = *arguments

  queue = search('project-euler', pattern)

  queue.each do |script|
    profile(script)
  end
end

# Usage: rake kattis[filename-pattern]
#
# rake kattis[different]
# rake kattis[diff]

task :kattis do |_, arguments|
  pattern, = *arguments

  queue = search('kattis', pattern)

  queue.each do |script|
    profile(script)
  end
end
