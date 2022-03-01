# All Test

result = Dir.chdir(__dir__) do
  problems = Dir['../src/*/*']

  problems.all? do |problem|
    script =
      if File.directory?(problem)
        'io.rb'
      else
        'puts.rb'
      end

    system('ruby', script, problem)
  end
end

exit(result)
