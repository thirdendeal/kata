# All Test

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

exit_status = Dir.chdir(__dir__) do
  solutions.each_slice(4).all? do |batch|
    batch.map! do |solution|
      script =
        if File.directory?(solution)
          'io.rb'
        else
          'puts.rb'
        end

      Thread.new do
        status = system('ruby', script, solution)

        status.tap do |success|
          puts(solution) unless success
        end
      end
    end

    batch.map(&:value).all?(true)
  end
end

exit(exit_status)
