# All Test

require 'etc'

require_relative 'all/solution'

solutions =
  if $stdin.tty?
    source = File.realpath(
      "#{__dir__}/../src"
    )

    Dir["#{source}/*/*"]
  else
    piped = $stdin.read.lines(chomp: true)

    piped.map do |path|
      File.realpath(path)
    end
  end

cpus = Etc.nprocessors

exit_status =
  solutions.each_slice(cpus).all? do |batch|
    batch.map! do |solution|
      test_case = Solution.new(solution)

      Thread.new do
        result = test_case.test

        result.tap do |success|
          puts(solution) unless success
        end
      end
    end

    batch.map(&:value).all?
  end

exit(exit_status)
