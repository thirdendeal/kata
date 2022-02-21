# Batch Solution Test

logic = ARGV[0]
group = ARGV[1]

pattern = File.expand_path(
  "#{__dir__}/../src/#{group}/*/"
)

result = Dir[pattern].all? do |directory|
  system("ruby \"#{__dir__}/utils/#{logic}.rb\" \"#{directory}\"")
end

exit(result)
