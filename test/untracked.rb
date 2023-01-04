# Usage: ruby untracked.rb [id]

require_relative 'solution/dispatch'
require_relative 'solution/filter'

untracked =
  `git status --short --untracked-files`
  .lines
  .map { |line| line.slice(3..).chomp }

filter =
  Filter
  .new(untracked)
  .under("#{__dir__}/../source")
  .extname('.rb')
  .feeling_lucky(ARGV[0])

abort("Error: No match found for \"#{ARGV[0]}\"") if ARGV[0] && filter.pathnames.empty?

dispatch =
  Dispatch
  .new(filter.pathnames)

dispatch.execute
