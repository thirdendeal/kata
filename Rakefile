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
