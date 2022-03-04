# All Test

exit_status = Dir.chdir(__dir__) do
  solutions = Dir['../src/*/*']

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
