# Print String Solution Test

# Usage: ruby puts.rb script.rb

# In a given script ending with a fat-arrow annotation:
#
# $ cat script.rb
# puts(2) # => 2
#
# Its output must be equal to its annotation value:
#
# 2

require 'open3'
require 'pathname'

# Define

HAS = {
  stderr: 'Error: Solution has a non-empty standard error'
}

NO = {
  argument:  'Error: No directory given as argument',
  file:      'Error: Argument is not a file',
  solution:  'Error: Solution output is different from annotation',
  stdout:    'Error: Solution has no output',
  zero_exit: 'Error: Solution has a non-zero exit status'
}

# Assure

abort(NO[:argument]) unless ARGV[0]
abort(NO[:file])     unless File.file?(ARGV[0])

# Input

script = Pathname.new(ARGV[0]).realpath

# Execute

stdout, stderr, status =
  Open3.capture3("ruby #{script}")

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

annotation =
  script
  .readlines
  .last
  .partition('# => ')
  .last

unless annotation.empty?
  unless annotation == stdout
    warn(NO[:solution], stdout)

    exit(false)
  end
end
