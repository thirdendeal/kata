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

class InputOutput
  HAS = {
    stderr: 'Error: Solution has a non-empty standard error'
  }

  NO = {
    argument:  'Error: No directory given as argument',
    directory: 'Error: Argument is not a directory',
    script:    'Error: Solution script is missing',
    solution:  'Error: Solution output is different from "output.txt"',
    stdout:    'Error: Solution has no output',
    zero_exit: 'Error: Solution has a non-zero exit status'
  }

  attr_reader :directory, :script, :input, :output

  def initialize(path)
    abort(NO[:directory]) unless File.directory?(path)

    @directory = Pathname.new(path).realdirpath

    @script = @directory.join(
      @directory.basename.sub_ext('.rb')
    )

    abort(NO[:script]) unless @script.exist?

    @input  = @directory.join('input.txt')
    @output = @directory.join('output.txt')

    execute
  end

  def test
    if @output.exist? && @output.read != @stdout
      warn(NO[:solution], @stdout)

      exit(false)
    end

    @status
  end

  private

  def execute
    @stdout, @stderr, @status =
      Open3.capture3('ruby', @script.to_path, @input.to_path)

    @status_code = @status.exitstatus

    warn(HAS[:stderr], @stderr)        unless @stderr.empty?
    warn(NO[:zero_exit], @status_code) unless @status.success?

    abort(NO[:stdout]) if @stdout.empty?
  end
end
