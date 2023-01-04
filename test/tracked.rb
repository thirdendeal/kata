# Usage: ruby tracked.rb [id]

require_relative 'solution/dispatch'
require_relative 'solution/filter'

tracked =
  `git ls-tree -r HEAD --name-only`
  .lines
  .map(&:chomp)

filter =
  Filter
  .new(tracked)
  .under("#{__dir__}/../source")
  .extname('.rb')
  .feeling_lucky(ARGV[0])

abort("Error: No match found for \"#{ARGV[0]}\"") if ARGV[0] && filter.pathnames.empty?

dispatch =
  Dispatch
  .new(filter.pathnames)

dispatch.execute
