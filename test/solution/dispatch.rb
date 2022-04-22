require_relative 'dispatch/check'
require_relative 'dispatch/expect'

require 'etc'

class Dispatch
  include Expect

  attr_accessor :checks

  def initialize(scripts)
    @checks = scripts.flat_map do |script|
      if directory_named?(script)
        directory(script)
      else
        script(script)
      end
    end
  end

  def execute
    cores = Etc.nprocessors

    @checks.each_slice(cores) do |checks|
      threads = checks.map do |check|
        Thread.new { check.run }
      end

      threads.map(&:join)
    end

    @checks.map(&:report)
  end

  private

  def directory_named?(script)
    script.basename('.*') == script.parent.basename
  end
end
