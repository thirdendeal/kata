# Project Euler
# ----------------------------------------------------------------------

def project_euler(script)
  {
    command: "ruby \"#{script}\"",
    expect: {
      'Standard Output' => annotation(script)
    }
  }
end

def annotation(script)
  File
    .read(script)
    .match(/# => ([[:digit:]]+\n)/)
    &.match(1)
end
