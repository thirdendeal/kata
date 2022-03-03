# All Test

result = Dir.chdir(__dir__) do
  problems = Dir['../src/*/*']

  problems.map! do |problem|
    script =
      if File.directory?(problem)
        'io.rb'
      else
        'puts.rb'
      end

    Thread.new do
      system('ruby', script, problem)
    end
  end

  problems.all?(&:value)
end

exit(result)
