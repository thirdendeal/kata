# Scheme
# ----------------------------------------------------------------------

require_relative 'scheme/kattis'
require_relative 'scheme/project_euler'

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

  [method(function_name)[script]]
end
