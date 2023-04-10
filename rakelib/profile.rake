# Profile
# ----------------------------------------------------------------------

require 'benchmark'
require 'open3'

# ----------------------------------------------------------------------

def profile(command)
  capture3, measure = capture(command)

  {
    'Standard Output' => (capture3[0] unless capture3[0].empty?),
    'Standard Error' => (capture3[1] unless capture3[1].empty?),
    'Exit Status Code' => (capture3[2] unless capture3[2].success?),

    'Real Time' => measure.real
  }
end

# ----------------------------------------------------------------------

def capture(command)
  capture3 = nil

  measure = Benchmark.measure do
    capture3 = Open3.capture3(command)
  end

  [capture3, measure]
end
