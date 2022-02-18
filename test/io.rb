# IO Solution Test

# Usage: ruby io.rb directory/

# In a given directory:
#
# attempt/
#  attempt.rb
#  input.txt
#  output.txt
#
# The output of:
#
# $ ruby attempt/attempt.rb attempt/input.txt
#
# Must be equal to:
#
# $ cat attempt/output.txt

require 'open3'
require 'pathname'

# Define

HAS = {
  stderr: 'Error: Solution has a non-empty standard error'
}

NO = {
  argument:  'Error: No directory given as argument',
  directory: 'Error: Argument is not a directory',
  solution:  'Error: Solution output is different from "output.txt"',
  stdout:    'Error: Solution has no output',
  zero_exit: 'Error: Solution has a non-zero exit status'
}

# Assure

abort(NO[:argument])  unless ARGV[0]
abort(NO[:directory]) unless File.directory?(ARGV[0])

# Input

directory = Pathname.new(ARGV[0]).realpath

script = directory.join("#{directory.basename}.rb")
input  = directory.join('input.txt')
output = directory.join('output.txt')

# Execute

stdout, stderr, status =
  Open3.capture3("ruby #{script} #{input}")

# Ensure

unless stderr.empty?
  warn(HAS[:stderr], stderr)

  exit(false)
end

unless status.success?
  warn(NO[:zero_exit], status)

  exit(false)
end

abort(NO[:stdout]) if stdout.empty?

# Output

if output.exist?
  unless output.read == stdout
    warn(NO[:solution], stdout)

    exit(false)
  end
end
