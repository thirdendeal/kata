# Solution Test

require 'open3'
require 'pathname'

require_relative 'validation'

class Solution
  include Validation

  def initialize(path)
    @input = []
    @output = []

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

    loop do
      execute

      reset do
        check_execute

        check_output unless @output.empty?
        check_annotation if @annotation
      end

      break if @output.empty?
    end

    correct?
  end

  private

  def execute
    @stdout, @stderr, @status =
      Open3.capture3("ruby #{@script} #{@input.pop}")

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
      Dir[pathname.join('input*.txt')].map do |path|
        Pathname.new(path)
      end

    @output =
      Dir[pathname.join('output*.txt')].map do |path|
        Pathname.new(path)
      end
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
