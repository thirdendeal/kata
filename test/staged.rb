# Usage: ruby staged.rb [id]

require_relative 'solution/dispatch'
require_relative 'solution/filter'

staged =
  `git diff --name-only --staged`
  .lines
  .map(&:chomp)

filter =
  Filter
  .new(staged)
  .under("#{__dir__}/../source")
  .extname('.rb')
  .feeling_lucky(ARGV[0])

abort("Error: No match found for \"#{ARGV[0]}\"") if ARGV[0] && filter.pathnames.empty?

dispatch =
  Dispatch
  .new(filter.pathnames)

dispatch.execute
