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

    @verbose = true

    verify
  end

  private

  def execute
    @capture3 = Open3.capture3(
      'ruby', @script.to_s, @input.to_s
    )
  end

  def verify
    stdout, stderr, status = @capture3
    code = status.exitstatus

    error(:stdout)         if     stdout.empty?
    error(:stderr, stderr) unless stderr.empty?
    error(:code, code)     if     code.nonzero?

    error(:output, stdout) if     @expect && @expect != stdout
  end
end
