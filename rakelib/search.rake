# Search
# ----------------------------------------------------------------------

def search(project, glob)
  mount = "source/#{project}/**"

  patterns = [
    "#{glob}.rb",  # exact
    "#{glob}*.rb", # start_with
    "*#{glob}.rb"  # end_with
  ]

  matches = patterns.lazy.map do |pattern|
    Dir.glob("#{mount}/#{pattern}")
  end

  matches.find(proc { [] }) do |match|
    !match.empty?
  end
end
