# Solution Test

require 'open3'
require 'pathname'

require_relative 'validation'

class Solution
  include Validation

  def initialize(path)
    pathname =
      Pathname.new(path).realpath

    if pathname.directory?
      source_directory(pathname)
    else
      source_file(pathname)
    end

    assert_source
  end

  def correct?
    !@error
  end

  def test
    return if @fatal

    execute

    reset do
      check_execute

      check_output if @output
      check_annotation if @annotation
    end

    correct?
  end

  private

  def execute
    @stdout, @stderr, @status =
      Open3.capture3("ruby #{@script} #{@input}")

    @code = @status.exitstatus
  end

  def reset
    @error = false

    yield
  end

  def source_directory(pathname)
    @script = pathname.join(
      pathname.basename.sub_ext('.rb')
    )

    @input =
      pathname.join('input.txt')

    @output =
      pathname.join('output.txt')
  end

  def source_file(pathname)
    @script = pathname

    @annotation =
      pathname
      .readlines
      .last
      .partition('# => ')
      .last
  end
end
