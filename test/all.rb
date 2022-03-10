# All Test

require_relative 'io'
require_relative 'puts'

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

exit_status =
  solutions.each_slice(4).all? do |batch|
    batch.map! do |solution|
      test_case =
        if File.directory?(solution)
          InputOutput.new(solution)
        else
          Puts.new(solution)
        end

      Thread.new do
        status = test_case.test

        status.tap do |success|
          puts(solution) unless success
        end
      end
    end

    batch.map(&:value).all?
  end

exit(exit_status)
