# All Test

require 'etc'

require_relative 'all/solution'

CPU    = Etc.nprocessors
SOURCE = "#{__dir__}/../src"

solutions =
  if $stdin.tty?
    Dir["#{SOURCE}/*/*"]
  else
    $stdin.read.lines(chomp: true)
  end

solutions.map! do |path|
  File.realpath(path)
end

exit_status =
  solutions.each_slice(CPU).all? do |batch|
    thread_pool = batch.map do |solution|
      test_case = Solution.new(solution)

      Thread.new do
        result = test_case.test

        result.tap do |success|
          puts(solution) unless success
        end
      end
    end

    thread_pool.map(&:value).all?
  end

exit(exit_status)
