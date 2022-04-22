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
  .under("#{__dir__}/../src")
  .extname('.rb')
  .feeling_lucky(ARGV[0])

dispatch =
  Dispatch
  .new(filter.pathnames)

dispatch.execute
