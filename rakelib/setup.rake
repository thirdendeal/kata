# Setup
# ----------------------------------------------------------------------

MAP = {
  'source/project-euler' => 'project_euler'
}

# ----------------------------------------------------------------------

def setup(script)
  dirname = File.dirname(script)

  _, function_name = MAP.find do |path, _|
    dirname.start_with?(path)
  end

  method(function_name)[script]
end

# ----------------------------------------------------------------------

def project_euler(script)
  command = "ruby \"#{script}\""

  annotation =
    File
    .read(script)
    .match(/# => ([[:digit:]]+\n)/)
    &.match(1)

  expect = {
    stdout: annotation
  }

  [command, expect]
end
