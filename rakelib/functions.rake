# Functions
# ----------------------------------------------------------------------

require 'benchmark'
require 'open3'

# ----------------------------------------------------------------------

def search(root, name)
  Dir.glob("#{root}/**/#{name}.rb")
end

# ----------------------------------------------------------------------

def euler(script)
  content = File.read(script)

  match = content.match(/# => ([[:digit:]]+\n)/)

  expect = match[1]

  report(script, expect)
end

# ----------------------------------------------------------------------

def profile(script)
  capture3 = nil

  measure = Benchmark.measure do
    capture3 = Open3.capture3("ruby \"#{script}\"")
  end

  [capture3, measure]
end

def report(script, expect)
  puts("=> ruby \"#{script}\"")

  capture3, measure = profile(script)

  time = measure.real

  puts('-> Real Time', time.round(3))

  verify(capture3, expect)
end

# ----------------------------------------------------------------------

def verify(capture3, expect)
  stdout, stderr, status = capture3

  check_output(stdout, expect)
  check_error(stderr)
  check_status(status)
end

# ----------------------------------------------------------------------

def check_error(stderr)
  return if stderr.empty?

  puts('-> Standard Error', stderr)
end

def check_output(stdout, expect)
  puts('-> Expected Standard Output', expect) if stdout != expect

  return if stdout.empty?

  puts('-> Standard Output', stdout)
end

def check_status(status)
  return unless status.exitstatus.nonzero?

  puts('-> Exit Status Code', status.exitstatus)
end
