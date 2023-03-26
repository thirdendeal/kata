# Profile
# ----------------------------------------------------------------------

def pretty_capture(command)
  capture = capture(command)

  capture.delete(:stdout) if capture[:stdout].empty?
  capture.delete(:stderr) if capture[:stderr].empty?
  capture.delete(:status) if capture[:status].success?

  capture[:time] = format(
    '%.3f',
    capture[:measure].real
  )

  capture
end

# ----------------------------------------------------------------------

def profile(script)
  pairs = setup(script)

  last_index = pairs.size - 1

  pairs.each_with_index do |pair, index|
    command, expect = pair

    puts("=> #{command}")
    capture = pretty_capture(command)

    report(capture, expect)

    puts unless index == last_index
  end
end
