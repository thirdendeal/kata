# Scheme
# ----------------------------------------------------------------------

MAP = {
  'source/kattis' => 'kattis',
  'source/project-euler' => 'project_euler'
}

# ----------------------------------------------------------------------

def scheme(script)
  dirname = File.dirname(script)

  _, function_name = MAP.find do |path, _|
    dirname.start_with?(path)
  end

  method(function_name)[script]
end

# ----------------------------------------------------------------------

def kattis(script)
  sample = "#{File.dirname(script)}/sample"

  origin = Dir.glob("#{sample}/input*")
  target = Dir.glob("#{sample}/output*")

  origin.zip(target).map do |input, output|
    [
      "ruby \"#{script}\" \"#{input}\"",
      {
        'Standard Output' => File.read(output)
      }
    ]
  end
end

def project_euler(script)
  command = "ruby \"#{script}\""

  annotation =
    File
    .read(script)
    .match(/# => ([[:digit:]]+\n)/)
    &.match(1)

  expect = {
    'Standard Output' => annotation
  }

  [[command, expect]]
end
