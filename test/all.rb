# All Test

stdin = ARGF.read unless STDIN.tty?

if stdin
  stdin = stdin.each_line.map do |line|
    File.absolute_path(line.chomp)
  end
end

exit_status = Dir.chdir(__dir__) do
  solutions =
    if String(stdin).empty?
      Dir['../src/*/*']
    else
      stdin
    end

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
