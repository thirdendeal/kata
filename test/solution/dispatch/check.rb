require_relative 'check/error'

require 'open3'

class Check
  include Error

  attr_reader :capture3, :failure

  def initialize(script, expect, input: nil)
    @script = script
    @expect = expect

    @input  = input
  end

  def run
    error_check do
      execute
      verify
    end
  end

  def report
    return if @failure.nil?

    @abort = true

    verify
  end

  private

  def execute
    @capture3 = Open3.capture3(
      'ruby', @script.to_s, @input.to_s
    )

    puts(@capture3.first) unless @expect || @capture3.first.empty?
  end

  def verify
    stdout, stderr, status = @capture3
    code = status.exitstatus

    error(:stderr, @script, stdout, stderr) unless stderr.empty?
    error(:code, @script, stdout, code)     if     code.nonzero?
    error(:stdout, @script, stdout)         if     stdout.empty?

    error(:output, @script, stdout) if @expect && @expect != stdout
  end
end
