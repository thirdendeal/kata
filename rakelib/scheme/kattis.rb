# Kattis
# ----------------------------------------------------------------------

def kattis(script)
  dirname = File.dirname(script)

  origin = Dir.glob("#{dirname}/sample/input*")
  target = Dir.glob("#{dirname}/sample/output*")

  origin.zip(target).map do |input, output|
    draft(script, input, output)
  end
end

def draft(script, input, output)
  {
    command: "ruby \"#{script}\" \"#{input}\"",
    expect: {
      'Standard Output' => File.read(output)
    }
  }
end
