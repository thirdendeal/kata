# Kattis Solution Test

require 'open3'
require 'pathname'

# Definition

NO = {
  argument:  'Error: No directory given as argument',
  directory: 'Error: Argument is not a directory',
  stdout:    'Error: Solution has no output',
  zero_exit: 'Error: Solution has a non-zero exit status'
}.freeze

# Guard-clause

abort(NO[:argument])  unless ARGV[0]
abort(NO[:directory]) unless File.directory?(ARGV[0])

# Input

directory = Pathname.new(ARGV[0]).realpath

file = {
  ruby:   directory.join("#{directory.basename}.rb"),

  input:  directory.join('input.txt'),
  output: directory.join('output.txt')
}

answer = IO.read(file[:output])

# Execution

stdout, status =
  Open3.capture2("ruby #{file[:ruby]} #{file[:input]}")

# Ensure

abort(NO[:stdout]) if stdout.empty?
abort(NO[:zero_exit]) unless status

# Output

abort(stdout) unless stdout == answer
