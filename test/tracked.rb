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
  .under("#{__dir__}/../src")
  .extname('.rb')
  .feeling_lucky(ARGV[0])

dispatch =
  Dispatch
  .new(filter.pathnames)

dispatch.execute
