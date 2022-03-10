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

class Puts
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

  attr_reader :script

  def initialize(path)
    abort(NO[:file]) unless File.file?(path)

    @script = Pathname.new(path).realpath

    execute
  end

  def test
    @annotation =
      @script
      .readlines
      .last
      .partition('# => ')
      .last

    if !@annotation.empty? && @annotation != @stdout
      warn(NO[:solution], @stdout)

      exit(false)
    end

    @status
  end

  private

  def execute
    @stdout, @stderr, @status =
      Open3.capture3('ruby', @script.to_path)

    @status_code = @status.exitstatus

    warn(HAS[:stderr], @stderr)        unless @stderr.empty?
    warn(NO[:zero_exit], @status_code) unless @status.success?

    abort(NO[:stdout]) if @stdout.empty?
  end
end
