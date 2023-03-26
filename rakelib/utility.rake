# Utility
# ----------------------------------------------------------------------

require 'benchmark'
require 'open3'

# ----------------------------------------------------------------------

def capture(command)
  capture3 = nil

  measure = Benchmark.measure do
    capture3 = Open3.capture3(command)
  end

  {
    stdout: capture3[0],
    stderr: capture3[1],
    status: capture3[2],

    measure:
  }
end
