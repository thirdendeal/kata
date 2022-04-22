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
  .under("#{__dir__}/../src")
  .extname('.rb')
  .feeling_lucky(ARGV[0])

dispatch =
  Dispatch
  .new(filter.pathnames)

dispatch.execute
